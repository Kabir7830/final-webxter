# Generated by Django 4.1 on 2024-12-21 10:05

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0037_alter_certificate_ids_end_date_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='certificate_ids',
            name='email',
        ),
    ]
