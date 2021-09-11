from core.settings import ADMIN_EMAIL, CORE_DIR, DEFAULT_FROM_EMAIL, EMAIL_HOST_USER, EMAIL_USE_TLS, STATICFILES_DIRS
from typing import Reversible
import datetime
import os
from django.http.response import HttpResponseRedirect, JsonResponse
from covid19.models import DonatePlasma, OtherRequest, RequestBed
from django.shortcuts import redirect, render
import json
from django.core.mail import send_mail
import smtplib
from email.mime.multipart import MIMEMultipart
from django.core.mail import EmailMessage



from django.template.loader import get_template, render_to_string

# Contact form
# from .forms import DonatePlasmaForm, OtherRequestForm, RequestBedForm


# Create your views here.

def sendNotifyEmail(name, email, requestType):
    subject = 'Your request has been received : COVID19 Response'
    ctx = {
        'name': name,
        'requestType': requestType
    }
    html_content = render_to_string('covid-19/notifyEmail.html', ctx)
    
    # message = f'Hi Admin, {name} from {address} has requested some help. Please respond back'
    email_from = DEFAULT_FROM_EMAIL
    recipient_list = [email, 'itsmeasmitapandey@gmail.com']
    send_mail( subject, html_content, email_from, recipient_list, html_message=html_content, fail_silently=False )



def emailtoAdmin(name, age,gender, email, phone, address, requestFor, additionalMsg):
    subject = 'New Request received : COVID19 Response'
    ctx = {
        'name': name,
        'age': age,
        'gender': gender,
        'email': email,
        'phone': phone,
        'address': address,
        'requestFor': requestFor,
        'additionalMsg': additionalMsg
    }

    html_content = render_to_string('covid-19/emailToAdmin.html', ctx)
    
    # message = f'Hi Admin, {name} from {address} has requested some help. Please respond back'
    email_from = DEFAULT_FROM_EMAIL
    html_message = "<b>Name: </b>" + str(name) + "\n<b>Age: </b>" +  str(age) + "\n<b>Phone: </b>"+  str(phone) + "\n<b>Email: </b>" +  str(email) + "\n<b>Address: </b>" +  str(address) + "\n<b>Additional Info: </b>" +  str(additionalMsg)
    recipient_list = [ADMIN_EMAIL, 'itsmeasmitapandey@gmail.com']
    send_mail( subject, html_content, email_from, recipient_list, html_message=html_content, fail_silently=False )