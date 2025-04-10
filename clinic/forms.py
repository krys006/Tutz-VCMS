from django import forms
from .models import Appointment, Pet
from django.contrib.auth.models import User

class AppointmentForm(forms.ModelForm):
    class Meta:
        model = Appointment
        fields = ['pet_name', 'appointment_date', 'time', 'reason']  # fields you want in the form

class PetForm(forms.ModelForm):
    class Meta:
        model = Pet
        fields = ['pet_name', 'species', 'breed', 'age', 'date_of_birth', 'medical_notes']

class RegistrationForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())
    password_confirmation = forms.CharField(widget=forms.PasswordInput())

    class Meta:
        model = User
        fields = ['username', 'email']

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get('password')
        password_confirmation = cleaned_data.get('password_confirmation')

        if password != password_confirmation:
            raise forms.ValidationError("Passwords do not match.")

        return cleaned_data