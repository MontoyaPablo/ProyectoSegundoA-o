# Generated by Django 4.2.1 on 2023-06-04 01:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ABM', '0014_pedido_domicilio_envio'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='producto',
            name='id_categoria',
        ),
        migrations.RemoveField(
            model_name='producto',
            name='id_condicion',
        ),
        migrations.RemoveField(
            model_name='producto',
            name='id_estado',
        ),
        migrations.RemoveField(
            model_name='producto',
            name='id_vendedor',
        ),
    ]