# Generated by Django 4.1 on 2024-08-23 06:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0026_requestcallback_course'),
    ]

    operations = [
        migrations.AddField(
            model_name='courses',
            name='is_featured',
            field=models.BooleanField(blank=True, default=False),
        ),
        migrations.AddField(
            model_name='courses',
            name='is_new',
            field=models.BooleanField(blank=True, default=True),
        ),
    ]
