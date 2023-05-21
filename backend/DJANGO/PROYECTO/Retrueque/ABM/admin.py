from django.contrib import admin

# Register your models here

from .models import Usuario
from .models import Categoria
from .models import Estado
from .models import Condicion
from .models import Producto
from .models import Carrito
from .models import CarritoDetalle
from .models import MetodoPago
from .models import Pedido
from .models import PedidoDetalle

class UsuarioAdmin(admin.ModelAdmin):
    list_display = ("nombre" , "apellido","email", "domicilio", "ciudad", "provincia", "cp", "fecha_nac"  )

class CategoriaAdmin(admin.ModelAdmin):
    list_display = ("nombre" , "descripcion" )
    
class EstadoAdmin(admin.ModelAdmin):
    list_display = ("nombre" , "descripcion" )

class CondicionAdmin(admin.ModelAdmin):
    list_display = ("nombre" , "descripcion" )

class ProductoAdmin(admin.ModelAdmin):
    list_display = ("nombre" , "descripcion" , "cantidad", "id_categoria", "id_estado", "id_condicion", "id_vendedor")

class CarritoAdmin(admin.ModelAdmin):
    list_display = ("fecha" , "id_comprador")

class CarritoDetalleAdmin(admin.ModelAdmin):
    list_display = ("id_carrito", "id_producto" , "cantidad", "precio" )

class MetodoPagoAdmin(admin.ModelAdmin):
    list_display = ("nombre" , "descripcion" )

class PedidoAdmin(admin.ModelAdmin):
    list_display = ("id_pedido", "fecha" , "observacion", "id_comprador", "total_pago", "domicilio_envio", "id_metodopago")

class PedidoDetalleAdmin(admin.ModelAdmin):
    list_display = ("id_pedido", "id_producto" , "cantidad", "precio", "id_pago" )


admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(Categoria, CategoriaAdmin)
admin.site.register(Estado, EstadoAdmin)
admin.site.register(Condicion, CondicionAdmin)
admin.site.register(Producto, ProductoAdmin)
admin.site.register(Carrito, CarritoAdmin)
admin.site.register(CarritoDetalle, CarritoDetalleAdmin)
admin.site.register(MetodoPago, MetodoPagoAdmin)
admin.site.register(Pedido, PedidoAdmin)
admin.site.register(PedidoDetalle, PedidoDetalleAdmin)