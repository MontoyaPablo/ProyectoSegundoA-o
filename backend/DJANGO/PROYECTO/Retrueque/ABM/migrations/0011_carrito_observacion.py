# Generated by Django 4.2.1 on 2023-05-21 15:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ABM', '0010_rename_nombre_pedido_observacion'),
    ]

    operations = [
        migrations.AddField(
            model_name='carrito',
            name='observacion',
            field=models.CharField(default='Sin Observar', max_length=100),
        ),
    ]