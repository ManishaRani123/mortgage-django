from covid19.models import DonatePlasma, RequestBed
from django import forms

class ContactForm(forms.ModelForm):
    class Meta:
        model= RequestBed
        exclude = ('o_name','o_contactNo','o_address','o_relation','requestOn','seenStatus','action_status')
        # fields = "__all__"
        # fields= ["age", "gender", "contactNo", "streetAddress", "city"]

class DonatePlasmaForm(forms.ModelForm):
    class Meta:
        model= DonatePlasma
        exclude = ('donor_option','requestOn','seenStatus','action_status')
        # fields = "__all__"
        # fields= ["age", "gender", "contactNo", "streetAddress", "city"]

def clean(self):
    cleaned_data = super(ContactForm, self).clean()
    name = cleaned_data.get('name')
    email = cleaned_data.get('email')
    message = cleaned_data.get('message')
    if not name and not email and not message:
        raise forms.ValidationError('You have to write something!')