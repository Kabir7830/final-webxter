# Generated by Django 4.1 on 2024-08-20 06:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0025_alter_courses_course_syllabus_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='requestcallback',
            name='course',
            field=models.CharField(blank=True, default='', max_length=255),
        ),
    ]
