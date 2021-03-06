# Generated by Django 2.2.10 on 2021-09-17 13:31

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('app', '0005_auto_20210917_1846'),
    ]

    operations = [
        migrations.AlterField(
            model_name='booknow',
            name='id',
            field=models.AutoField(primary_key=True, serialize=False, unique=True),
        ),
        migrations.RemoveField(
            model_name='booknow',
            name='user',
        ),
        migrations.AddField(
            model_name='booknow',
            name='user',
            field=models.ManyToManyField(to=settings.AUTH_USER_MODEL),
        ),
        migrations.CreateModel(
            name='UserPropertyBookmark',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bookmarkedOn', models.DateTimeField(auto_now_add=True, verbose_name='Bookmarked On')),
                ('property', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.Property')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
