# Generated by Django 3.2.15 on 2023-04-13 10:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('chatbot', '0004_query'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='query',
            name='query_id',
        ),
    ]
