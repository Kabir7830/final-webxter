# Generated by Django 4.1 on 2024-07-26 10:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0010_enrolledstudents_is_read'),
    ]

    operations = [
        migrations.AddField(
            model_name='carouselimages',
            name='carousel_redirect_link',
            field=models.TextField(blank=True, default='#'),
        ),
    ]