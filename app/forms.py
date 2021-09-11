from covid19.models import DonatePlasma, OtherRequest, RequestBed
from django import forms

class OtherRequestForm(forms.ModelForm):
    class Meta:
        model= OtherRequest
        exclude = ('requestOn','seenStatus','action_status')

def clean(self):
    cleaned_data = super(RequestBed, self).clean()
    name = cleaned_data.get('name')
    email = cleaned_data.get('email')
    age = cleaned_data.get('age')
    if not name and not email and not age:
        raise forms.ValidationError('You have to write something!')