# Generated by Django 4.1 on 2024-08-24 05:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0031_markdownfiles_courses_markdown_file'),
    ]

    operations = [
        migrations.AlterField(
            model_name='markdownfiles',
            name='title',
            field=models.CharField(max_length=255),
        ),
    ]
