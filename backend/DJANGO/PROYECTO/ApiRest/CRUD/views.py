from django.shortcuts import get_object_or_404, render

from django.contrib.auth import authenticate, login, logout
from rest_framework import status, generics
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import UserSerializer
from .models import Categoria, Producto, CustomUser
from rest_framework.permissions import IsAdminUser, AllowAny, IsAuthenticated
from .serializers import ProductoSerializer
from .serializers import CategoriaSerializer
from rest_framework import viewsets
import mercadopago
import json


class LoginView(APIView):
    permission_classes = [AllowAny] 
    def post(self, request):
        # Recuperamos las credenciales y autenticamos al usuario
        email = request.data.get('email', None)
        password = request.data.get('password', None)
        user = authenticate(email=email, password=password)
        # Si es correcto añadimos a la request la información de sesión
        if user:
            login(request, user)
            return Response(
                UserSerializer(user).data,
                status=status.HTTP_200_OK)
        # Si no es correcto devolvemos un error en la petición
        return Response(
            status=status.HTTP_404_NOT_FOUND)


class LogoutView(APIView):
    permission_classes = [AllowAny] 
    def post(self, request):
        # Borramos de la request la información de sesión
        logout(request)

        # Devolvemos la respuesta al cliente
        return Response(status=status.HTTP_200_OK)
class SignupView(generics.CreateAPIView):
    serializer_class = UserSerializer

class verProductos(viewsets.ReadOnlyModelViewSet):
    permission_classes = [AllowAny] 
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer

class verCategorias(viewsets.ReadOnlyModelViewSet):
    permission_classes = [AllowAny]
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

class agregarProducto(APIView):
    permission_classes = [IsAdminUser]
    def post(self, request, format=None):
        serializer = ProductoSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,
                        status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class ProfileView(generics.RetrieveUpdateAPIView):
    permission_classes = [IsAuthenticated] #Solo usuarios logueados pueden ver.
    serializer_class = UserSerializer
    http_method_names = ['get', 'patch']
    def get_object(self):
        if self.request.user.is_authenticated:
            return self.request.user
class ListarUsuarios(generics.ListCreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer
    http_method_names = ['get']
    permission_classes = [IsAdminUser]
    def list(self, request):
        queryset = self.get_queryset()
        serializer = UserSerializer(queryset, many=True)
        if self.request.user.is_authenticated:
            return Response(serializer.data)

class ProcessPaymentAPIView(APIView):
    def post(self, request):
        try:
            request_values = json.loads(request.body)
            payment_data = {
                "transaction_amount": float(request_values["transaction_amount"]),
                "token": request_values["token"],
                "installments": int(request_values["installments"]),
                "payment_method_id": request_values["payment_method_id"],
                "issuer_id": request_values["issuer_id"],
                "payer": {
                    "email": request_values["payer"]["email"],
                    "identification": {
                        "type": request_values["payer"]["identification"]["type"],
                        "number": request_values["payer"]["identification"]["number"],
                    },
                },
            }

            sdk = mercadopago.SDK("TEST-6235583635172323-062823-7f2c1fb3049e7e118118d1fb73e1809e-43467100")

            payment_response = sdk.payment().create(payment_data)

            payment = payment_response["response"]
            status = {
                "id": payment["id"],
                "status": payment["status"],
                "status_detail": payment["status_detail"],
            }

            return Response(data={"body": status, "statusCode": payment_response["status"]}, status=201)
        except Exception as e:
            return Response(data={"body": payment_response}, status=400)

class retornarPagado(APIView):  # Retornar custom json 
    def get(self, request):
        return Response({"respuesta": "aprobado"})
    

#Return Custom json, reduzca el stock segun lo enviado.
class customjsonybajarstock(APIView):
    permission_classes = [IsAdminUser] #Solo permito admins.
    def patch(self, request, pk, cantidad): #Utilizo patch para la modificacion parcial.
        model = get_object_or_404(Producto, pk=pk) #Pido el objeto mandandole el ID. 
        data = {"cantidad": model.cantidad - int(cantidad)} #Del json, le resto la cantidad.
        serializer = ProductoSerializer(model, data=data, partial=True) #Paso la data al serializer.

        if serializer.is_valid(): #Si es valido lo que mande
            serializer.save() #Guardo el response (va a mandar el json del producto con la cantidad actualizada)
            agregarcustomjson={"respuesta": "aprobado"}
            agregarcustomjson.update(serializer.data)  #A ese json anterior, le agrego la respuesta de la transaccion.
            return Response(agregarcustomjson)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class ProductoViewSet(viewsets.ModelViewSet):
    queryset=Producto.objects.all()
    serializer_class= ProductoSerializer