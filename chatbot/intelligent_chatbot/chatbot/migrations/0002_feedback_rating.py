# Generated by Django 3.2.15 on 2023-03-23 10:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chatbot', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='feedback',
            name='rating',
            field=models.CharField(default=2, max_length=100),
            preserve_default=False,
        ),
    ]
