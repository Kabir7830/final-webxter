# Generated by Django 4.1 on 2024-08-03 11:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0021_rename_emergency_conatct_relationship_registerationform_emergency_contact_relationship'),
    ]

    operations = [
        migrations.RenameField(
            model_name='registerationform',
            old_name='higest_education_qualification',
            new_name='highest_education_qualification',
        ),
    ]
