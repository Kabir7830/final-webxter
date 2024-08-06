# Generated by Django 4.1 on 2024-08-06 12:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0024_alter_courses_benefits_alter_courses_curriculum_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='courses',
            name='course_syllabus',
            field=models.FileField(upload_to='course_syllabus/'),
        ),
        migrations.AlterField(
            model_name='courses',
            name='featured_image',
            field=models.ImageField(upload_to='featured_images/'),
        ),
        migrations.AlterField(
            model_name='courses',
            name='summary',
            field=models.CharField(max_length=200),
        ),
    ]