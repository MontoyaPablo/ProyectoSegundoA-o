from rest_framework import serializers
from .models import Producto, Usuario

class ProductoSerializer(serializers.ModelSerializer):
 class Meta:
  model= Producto
  fields=('nombre', 'descripcion','cantidad')
  
class UsuarioSerializer(serializers.ModelSerializer):
 class Meta:
  model= Usuario
  fields=('dni','email','password')
  
