from django.shortcuts import render
from rest_framework import viewsets
from .serializers import ProductoSerializer, UsuarioSerializer
from .models import Producto, Usuario

# Create your views here.
class ProductoViewSet(viewsets.ModelViewSet):
 queryset=Producto.objects.all()
 serializer_class= ProductoSerializer
 
class UsuarioViewSet(viewsets.ModelViewSet):
    queryset=Usuario.objects.all()
    serializer_class= UsuarioSerializer