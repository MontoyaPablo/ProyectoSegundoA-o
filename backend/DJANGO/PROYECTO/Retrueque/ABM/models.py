from django.db import models

# Create your models here.

class Usuario(models.Model):
    dni = models.IntegerField(primary_key = True)
    nombre = models.CharField(max_length=100, blank = False)
    apellido = models.CharField(max_length=100, blank = False)
    domicilio = models.TextField(max_length=1000, blank = False)
    ciudad= models.CharField(max_length=100, blank = False)
    email = models.EmailField(max_length=100, blank = False)
    provincia = models.CharField(max_length=100, blank = False)
    cp = models.IntegerField(blank = False)
    fecha_nac = models.DateField(blank = False)
    class Meta:
        db_table = "Usuario"
        verbose_name = "Usuarios que compran/venden/trocan productos"
        verbose_name_plural  = "Usuarios"
    def __unicode__(self):
        return self.nombre
    def __str__(self):
        return self.nombre


class Categoria(models.Model):
    id_categoria = models.AutoField(primary_key = True)
    nombre = models.CharField(max_length=100, blank = False)
    descripcion = models.TextField(max_length=1000, blank = False)
    class Meta:
        db_table = "Categoria"
        verbose_name = "Categoria del Producto"
        verbose_name_plural  = "Categorias"
    def __unicode__(self):
        return self.nombre
    def __str__(self):
        return self.nombre

class Estado(models.Model):
    id_estado = models.AutoField(primary_key = True)
    nombre = models.CharField(max_length=100, blank = False)
    descripcion = models.TextField(max_length=1000, blank = False)
    class Meta:
        db_table = "Estado"
        verbose_name = "Estado del Producto"
        verbose_name_plural  = "Estados"
    def __unicode__(self):
        return self.nombre
    def __str__(self):
        return self.nombre


class Condicion(models.Model):
    id_condicion = models.AutoField(primary_key = True)
    nombre = models.CharField(max_length=100, blank = False)
    descripcion = models.TextField(max_length=1000, blank = False)
    class Meta:
        db_table = "Condicion"
        verbose_name = "Condicion venta/trueque del Producto"
        verbose_name_plural  = "Condiciones"
    def __unicode__(self):
        return self.nombre
    def __str__(self):
        return self.nombre

class Producto(models.Model):
    id_producto = models.AutoField(primary_key = True)
    nombre = models.CharField(max_length=100, blank = False)
    descripcion = models.TextField(max_length=1000, blank = False)
    cantidad = models.IntegerField(blank = False, default = 0)
    id_categoria = models.ForeignKey(Categoria, to_field="id_categoria", on_delete=models.CASCADE)
    id_estado = models.ForeignKey(Estado, to_field="id_estado", on_delete=models.CASCADE)
    id_condicion = models.ForeignKey(Condicion, to_field="id_condicion", on_delete=models.CASCADE)
    id_vendedor = models.ForeignKey(Usuario, to_field="dni", on_delete=models.CASCADE)
    class Meta:
        db_table = "Producto"
        verbose_name = "Productos Publicados"
        verbose_name_plural  = "Productos"
    def __unicode__(self):
        return self.nombre
    def __str__(self):
        return self.nombre

class Carrito(models.Model):
    id_carrito = models.AutoField(primary_key = True)
    fecha = models.DateField(blank = False)
    observacion = models.CharField(max_length=100, blank = False, default="Sin Observar")
    id_comprador = models.ForeignKey(Usuario, to_field="dni", on_delete=models.CASCADE)
    class Meta:
        db_table = "Carrito"
        verbose_name = "Datos de la carga de productos"
        verbose_name_plural  = "Carritos"
    def __unicode__(self):
        return self.id_carrito
    def __int__(self):
        return self.id_carrito

class CarritoDetalle(models.Model):
    id_carrito = models.ForeignKey(Carrito, to_field="id_carrito", on_delete=models.CASCADE)
    id_producto = models.ForeignKey(Producto, to_field="id_producto", on_delete=models.CASCADE)
    cantidad = models.IntegerField(blank = False, default = 0)
    precio = models.DecimalField(decimal_places = 2, max_digits=10, blank = False)
    class Meta:
        db_table = "CarritoDetalle"
        verbose_name = "Detalle de la carga de productos"
        verbose_name_plural  = "Detalles_Carrito"
    def __unicode__(self):
        return self.id_carrito
    def __int__(self):
        return self.id_carrito

class MetodoPago(models.Model):
    id_metodopago = models.AutoField(primary_key = True)
    nombre = models.CharField(max_length=100, blank = False)
    descripcion = models.TextField(max_length=1000, blank = False)
    class Meta:
        db_table = "MetodoPago"
        verbose_name = "Forma de Pago"
        verbose_name_plural  = "MetodosPago"
    def __unicode__(self):
        return self.nombre
    def __str__(self):
        return self.nombre

class Pedido(models.Model):
    id_pedido = models.AutoField(primary_key = True)
    fecha = models.DateField(blank = False)
    observacion = models.CharField(max_length=100, blank = False, default="Sin Observar")
    id_comprador = models.ForeignKey(Usuario, to_field="dni", on_delete=models.CASCADE)
    total_pago = models.DecimalField(decimal_places = 2, max_digits=10, blank = False)
    id_metodopago = models.ForeignKey(MetodoPago, to_field="id_metodopago", on_delete=models.CASCADE)
    domicilio_envio = models.TextField(max_length=1000, blank=False, default="El mismo domicilio del usuario")
    class Meta:
        db_table = "Pedido"
        verbose_name = "Confirmacion de la carga de productos"
        verbose_name_plural  = "Pedidos"
    def __unicode__(self):
        return self.id_pedido
    def __int__(self):
        return self.id_pedido

class PedidoDetalle(models.Model):
    id_pedido = models.ForeignKey(Carrito, to_field="id_carrito", on_delete=models.CASCADE)
    id_producto = models.ForeignKey(Producto, to_field="id_producto", on_delete=models.CASCADE)
    cantidad = models.IntegerField(blank = False, default = 0)
    precio = models.DecimalField(decimal_places = 2, max_digits=10, blank = False)
    id_pago = models.IntegerField(blank = False, default = 0)
    class Meta:
        db_table = "PedidoDetalle"
        verbose_name = "Confirmacion Detalle de la carga de productos"
        verbose_name_plural  = "Detalles_Pedido"
    def __unicode__(self):
        return self.id_pedido
    def __int__(self):
        return self.id_pedido

    
    



