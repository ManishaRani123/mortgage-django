# Generated by Django 2.2.10 on 2021-05-08 08:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('covid19', '0007_auto_20210508_1203'),
    ]

    operations = [
        migrations.CreateModel(
            name='DonatePlasma',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('donor_name', models.CharField(max_length=100, verbose_name='Full Name')),
                ('donor_age', models.IntegerField()),
                ('donor_gender', models.CharField(choices=[('M', 'Male'), ('F', 'Female'), ('O', 'Other')], default='Other', max_length=1, verbose_name='Gender')),
                ('donor_contactNo', models.CharField(max_length=15, verbose_name='Contact No')),
                ('donor_streetAddress', models.CharField(max_length=200, verbose_name='Street Address')),
                ('donor_city', models.CharField(max_length=100, verbose_name='City')),
                ('donor_state', models.CharField(choices=[('AU-NSW', 'New South Wales'), ('AU-QLD', 'Queensland'), ('AU-SA', 'South Australia'), ('AU-TAS', 'Tasmania'), ('AU-VIC', 'Victoria'), ('AU-WA', 'Western Australia')], default='', max_length=30, verbose_name='State')),
                ('additionalInfo', models.TextField(blank=True, null=True, verbose_name='Additional Information')),
                ('requestOn', models.DateTimeField(auto_now_add=True, verbose_name='Request Date')),
                ('seenStatus', models.BooleanField(default=False, verbose_name='Seen Status')),
                ('donor_option', models.CharField(choices=[('', 'Please Select'), ('Request Received', 'Request Received'), ('Waiting', 'Waiting'), ('Looking for Donor', 'Looking for Donor'), ('Under Approval', 'Under Approval'), ('Transfer in Progress', 'Transfer in Progress'), ('Cancelled', 'Cancelled'), ('Approved', 'Approved'), ('Patient Expired', 'Patient Expired'), ('Donor Does not Fit', 'Donor Does not Fit'), ('Request More', 'Request More')], default='Receive', max_length=10, verbose_name='Plasma Donate')),
            ],
        ),
    ]
