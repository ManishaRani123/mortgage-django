# Generated by Django 2.2.10 on 2021-05-07 08:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('covid19', '0002_auto_20210507_1348'),
    ]

    operations = [
        migrations.AlterField(
            model_name='requestbed',
            name='contactNo',
            field=models.CharField(max_length=15),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='gender',
            field=models.CharField(choices=[('M', 'Male'), ('F', 'Female'), ('O', 'Other')], default='Other', max_length=1),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='o_relation',
            field=models.CharField(max_length=10),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='state',
            field=models.CharField(choices=[('AU-NSW', 'New South Wales'), ('AU-QLD', 'Queensland'), ('AU-SA', 'South Australia'), ('AU-TAS', 'Tasmania'), ('AU-VIC', 'Victoria'), ('AU-WA', 'Western Australia')], default='', max_length=30),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='urgency',
            field=models.CharField(choices=[('Urgent', 'Urgent'), ('Moderate', 'Moderate'), ('Not Urgent', 'Not Urgent')], default='Not Urgent', max_length=10),
        ),
    ]
