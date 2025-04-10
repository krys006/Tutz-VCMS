# clinic/views.py
from django.shortcuts import render, redirect, get_object_or_404
from .models import Appointment, BillingTransaction, Pet, Notification
from django.views.generic import ListView, CreateView
from .forms import AppointmentForm, RegistrationForm, PetForm
from django.contrib.auth.decorators import login_required
'''from django.contrib.auth.mixins import LoginRequiredMixin'''


''''
@login_required
def AppointmentListView(ListView):


class AppointmentListView(LoginRequiredMixin, ListView):
    model = Appointment
    template_name = 'clinic/appointment_list.html'  # your HTML file
    context_object_name = 'appointments'
    login_url = '/login/'  # where to redirect if not logged in
'''

def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])
            user.save()
            return redirect('login')  # Redirect to login after registration
    else:
        form = RegistrationForm()
    return render(request, 'clinic/register.html', {'form': form})

# Appointment List View (to display all appointments)
class AppointmentListView(ListView):
    model = Appointment
    template_name = 'clinic/appointment_list.html'  # Template to render
    context_object_name = 'appointments'

'''
# Appointment Create View (for adding new appointments)
class AppointmentCreateView(CreateView):
    model = Appointment
    form_class = AppointmentForm  # Use your form here
    template_name = 'clinic/appointment_form.html'  # Template to render
    //fields = ['pet_name', 'appointment_date', 'time', 'status']//

    def form_valid(self, form):
        # Add custom behavior here if necessary
        return super().form_valid(form)
        
'''

@login_required
def register_pet(request):
    if request.method == 'POST':
        # Create a form instance and populate it with data from the request
        form = PetForm(request.POST)
        if form.is_valid():
            # Save the pet with the current user as the owner
            pet = form.save(commit=False)
            pet.owner = request.user  # Automatically assign the logged-in user as the pet's owner
            pet.save()  # Save the pet to the database

            return redirect('pet_list')  # Redirect to a page where the pets are listed

    else:
        form = PetForm()

    return render(request, 'clinic/register_pet.html', {'form': form})


@login_required
def pet_list(request):
    pets = Pet.objects.filter(owner=request.user)
    return render(request, 'clinic/pet_list.html', {'pets': pets})


@login_required
def create_appointment(request):
    # Check if the user has any pets
    pets = Pet.objects.filter(owner=request.user)

    if not pets.exists():
        return redirect('register_pet')  # Redirect to pet registration if no pet is added

    if request.method == 'POST':
        pet_id = request.POST.get('pet_name')  # Get the selected pet from the form
        appointment_date = request.POST.get('appointment_date')
        time = request.POST.get('time')
        reason = request.POST.get('reason')

        # Save the new appointment
        Appointment.objects.create(
            user=request.user,
            pet_name_id=pet_id,  # Store the selected pet ID
            appointment_date=appointment_date,
            time=time,
            reason=reason
        )
        return redirect('pet_owner_dashboard')  # Redirect after saving the appointment

    # If the request is GET, render the form with the available pets
    return render(request, 'clinic/create_appointment.html', {'pets': pets})


@login_required
def view_pets(request):
    pets = Pet.objects.filter(owner=request.user)
    return render(request, 'clinic/pet_list.html', {'pets': pets})

@login_required
def view_appointments(request):
    appointments = Appointment.objects.filter(user=request.user)
    return render(request, 'clinic/appointment_list.html', {'appointments': appointments})


@login_required
def view_medical_records(request):
    pets = Pet.objects.filter(owner=request.user)
    medical_records = []
    
    for pet in pets:
        medical_records.append({
            'pet_name': pet.pet_name,
            'medical_notes': pet.medical_notes,
        })
    
    return render(request, 'clinic/medical_records_list.html', {'medical_records': medical_records})




'''
@login_required
def dashboard(request):
    appointments = Appointment.objects.filter(user=request.user)
    return render(request, 'clinic/dashboard.html', {'appointments': appointments})
'''
@login_required
def pet_owner_dashboard(request):
    user = request.user
    pets = Pet.objects.filter(owner=user)
    appointments = Appointment.objects.filter(pet_name__owner=user).order_by('-appointment_date')

    return render(request, 'clinic/pet_owner_dashboard.html', {
        'appointments': appointments,
        'pets': pets,
       
    })


@login_required
def view_notifications(request):
    notifications = Notification.objects.filter(user=request.user, is_read=False).order_by('-created_at')
    return render(request, 'clinic/view_notifications.html', {'notifications': notifications})


def view_appt_notif(request, pk):
    appointment = get_object_or_404(Appointment, pk=pk)
    return render(request, 'clinic/notif_appt_details.html', {'appointment': appointment})






# Billing Transaction List View (to display all billing transactions)
class BillingTransactionListView(ListView):
    model = BillingTransaction
    template_name = 'clinic/billing_transaction_list.html'
    context_object_name = 'transactions'

# Billing Transaction Create View (to create new transactions)
class BillingTransactionCreateView(CreateView):
    model = BillingTransaction
    template_name = 'clinic/billing_transaction_form.html'
    fields = ['appointment', 'amount', 'payment_status', 'proof_of_payment']
