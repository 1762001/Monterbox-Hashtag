# Generated by Django 2.2.2 on 2019-12-14 08:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_page', '0007_auto_20191212_1829'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='in_stock',
            field=models.CharField(max_length=50),
        ),
    ]