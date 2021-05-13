# Generated by Django 2.2.10 on 2021-05-13 03:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('covid19', '0011_auto_20210508_2027'),
    ]

    operations = [
        migrations.CreateModel(
            name='OtherRequest',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('full_name', models.CharField(max_length=200, verbose_name='Full Name')),
                ('age', models.IntegerField()),
                ('gender', models.CharField(choices=[('Male', 'Male'), ('Female', 'Female'), ('Other', 'Other')], default='Other', max_length=10, verbose_name='Gender')),
                ('contactNo', models.CharField(max_length=20, verbose_name='Contact No')),
                ('streetAddress', models.CharField(max_length=200, verbose_name='Street Address')),
                ('city', models.CharField(max_length=300, verbose_name='City')),
                ('state', models.CharField(choices=[('AU-NSW', 'New South Wales'), ('AU-QLD', 'Queensland'), ('AU-SA', 'South Australia'), ('AU-TAS', 'Tasmania'), ('AU-VIC', 'Victoria'), ('AU-WA', 'Western Australia')], default='', max_length=30, verbose_name='State')),
                ('requestType', models.CharField(choices=[('Oxygen', 'Oxygen'), ('Food', 'Food'), ('Cremation', 'Cremation'), ('Quarantine Space', 'Quarantine Space'), ('Other', 'Other')], default='Receive', max_length=100, verbose_name='Plasma Donate')),
                ('additionalInfo', models.TextField(blank=True, null=True, verbose_name='Additional Information')),
                ('requestOn', models.DateTimeField(auto_now_add=True, verbose_name='Request Date')),
                ('seenStatus', models.BooleanField(default=False, verbose_name='Seen Status')),
                ('action_status', models.CharField(blank=True, choices=[('', 'Please Select'), ('Request Received', 'Request Received'), ('Waiting', 'Waiting'), ('Under Approval', 'Under Approval'), ('Cancelled', 'Cancelled'), ('Approved', 'Approved'), ('Unspecified', 'Unspecified')], default='Receive', max_length=200, verbose_name='Plasma Donate')),
            ],
        ),
    ]