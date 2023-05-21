# Generated by Django 4.2.1 on 2023-05-21 04:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ABM', '0006_carritodetalle'),
    ]

    operations = [
        migrations.CreateModel(
            name='MetodoPago',
            fields=[
                ('id_metodopago', models.AutoField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=100)),
                ('descripcion', models.TextField(max_length=1000)),
            ],
            options={
                'verbose_name': 'Forma de Pago',
                'verbose_name_plural': 'MetodosPago',
                'db_table': 'MetodoPago',
            },
        ),
        migrations.CreateModel(
            name='PedidoDetalle',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cantidad', models.IntegerField(default=0)),
                ('precio', models.DecimalField(decimal_places=2, max_digits=10)),
                ('id_pago', models.IntegerField(default=0)),
                ('id_pedido', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ABM.carrito')),
                ('id_producto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ABM.producto')),
            ],
            options={
                'verbose_name': 'Confirmacion Detalle de la carga de productos',
                'verbose_name_plural': 'Detalles_Pedido',
                'db_table': 'PedidoDetalle',
            },
        ),
        migrations.CreateModel(
            name='Pedido',
            fields=[
                ('id_pedido', models.AutoField(primary_key=True, serialize=False)),
                ('fecha', models.DateField()),
                ('total_pago', models.DecimalField(decimal_places=2, max_digits=10)),
                ('id_comprador', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ABM.usuario')),
                ('id_metodopago', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ABM.metodopago')),
            ],
            options={
                'verbose_name': 'Confirmacion de la carga de productos',
                'verbose_name_plural': 'Pedidos',
                'db_table': 'Pedido',
            },
        ),
    ]