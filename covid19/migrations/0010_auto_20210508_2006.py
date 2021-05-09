# Generated by Django 2.2.10 on 2021-05-08 14:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('covid19', '0009_auto_20210508_1536'),
    ]

    operations = [
        migrations.AlterField(
            model_name='donateplasma',
            name='action_status',
            field=models.CharField(blank=True, choices=[('', 'Please Select'), ('Request Received', 'Request Received'), ('Waiting', 'Waiting'), ('Looking for Donor', 'Looking for Donor'), ('Under Approval', 'Under Approval'), ('Transfer in Progress', 'Transfer in Progress'), ('Cancelled', 'Cancelled'), ('Approved', 'Approved'), ('Patient Expired', 'Patient Expired'), ('Donor Does not Fit', 'Donor Does not Fit'), ('Request More', 'Request More')], default='Receive', max_length=200, verbose_name='Plasma Donate'),
        ),
        migrations.AlterField(
            model_name='donateplasma',
            name='city',
            field=models.CharField(max_length=300, verbose_name='City'),
        ),
        migrations.AlterField(
            model_name='donateplasma',
            name='contactNo',
            field=models.CharField(max_length=20, verbose_name='Contact No'),
        ),
        migrations.AlterField(
            model_name='donateplasma',
            name='donor_option',
            field=models.CharField(choices=[('Receive', 'I am Looking for Plasma Donor'), ('Donate', 'I want to donate Plasma')], default='Receive', max_length=100, verbose_name='Plasma Donate'),
        ),
        migrations.AlterField(
            model_name='donateplasma',
            name='full_name',
            field=models.CharField(max_length=200, verbose_name='Full Name'),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='action_status',
            field=models.CharField(choices=[('Solved', 'Solved'), ('Request Received', 'Request Received'), ('Waiting', 'Waiting'), ('Under Approval', 'Under Approval'), ('Cancelled', 'Cancelled'), ('Approved', 'Approved'), ('Patient Expired', 'Patient Expired'), ('Not available', 'Not available'), ('Still Finding', 'Still Finding')], default='Receive', max_length=200, verbose_name='Plasma Donate'),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='bedType',
            field=models.CharField(choices=[('ICU', 'ICU'), ('Normal', 'Normal'), ('Isolation', 'Isolation'), ('Ventilator', 'Ventilator'), ('Unspecified', 'Unspecified')], default='Normal', max_length=30, verbose_name='Bed Type'),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='city',
            field=models.CharField(max_length=200, verbose_name='City'),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='contactNo',
            field=models.CharField(max_length=25, verbose_name='Contact No'),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='full_name',
            field=models.CharField(max_length=200, verbose_name='Full Name'),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='o_contactNo',
            field=models.CharField(blank=True, max_length=30, null=True),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='o_name',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='o_relation',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='state',
            field=models.CharField(choices=[('AU-NSW', 'New South Wales'), ('AU-QLD', 'Queensland'), ('AU-SA', 'South Australia'), ('AU-TAS', 'Tasmania'), ('AU-VIC', 'Victoria'), ('AU-WA', 'Western Australia')], default='', max_length=150, verbose_name='State'),
        ),
        migrations.AlterField(
            model_name='requestbed',
            name='urgency',
            field=models.CharField(choices=[('Urgent', 'Urgent'), ('Moderate', 'Moderate'), ('Not Urgent', 'Not Urgent')], default='Not Urgent', max_length=20, verbose_name='Urgency'),
        ),
    ]
