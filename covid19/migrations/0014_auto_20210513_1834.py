# Generated by Django 2.2.10 on 2021-05-13 12:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('covid19', '0013_auto_20210513_1805'),
    ]

    operations = [
        migrations.AddField(
            model_name='otherrequest',
            name='email',
            field=models.CharField(max_length=128, null=True, verbose_name='Email'),
        ),
        migrations.AlterField(
            model_name='donateplasma',
            name='email',
            field=models.CharField(max_length=128, null=True, verbose_name='Email'),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='email',
            field=models.CharField(max_length=128, null=True, verbose_name='Email'),
        ),
    ]