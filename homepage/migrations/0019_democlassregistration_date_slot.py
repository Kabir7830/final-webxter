# Generated by Django 4.1 on 2024-08-02 08:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('homepage', '0018_rename_time_slot_timeslots_end_slot_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='democlassregistration',
            name='date_slot',
            field=models.CharField(blank=True, default='', max_length=30),
        ),
    ]
