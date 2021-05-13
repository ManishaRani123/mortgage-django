from covid19.models import DonatePlasma, OtherRequest, RequestBed
from django import forms

class RequestBedForm(forms.ModelForm):
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