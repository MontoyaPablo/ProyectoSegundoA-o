# Generated by Django 4.2.1 on 2023-05-21 04:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ABM', '0007_metodopago_pedidodetalle_pedido'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usuario',
            name='id_usuario',
        ),
    ]