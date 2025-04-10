from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

class PetOwner(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone_number = models.CharField(max_length=15)
    address = models.TextField()

    def __str__(self):
        return self.user.username

class Pet(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE, related_name='pets')
    pet_name = models.CharField(max_length=100)
    species = models.CharField(max_length=100)
    breed = models.CharField(max_length=100, blank=True)
    age = models.IntegerField()
    date_of_birth = models.DateField()  # Added date_of_birth field
    medical_notes = models.TextField(blank=True)

    def __str__(self):
        return self.pet_name

class Appointment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    pet_name = models.ForeignKey('Pet', on_delete=models.CASCADE)
    appointment_date = models.DateTimeField()
    time = models.TimeField(default="00:00")
    reason = models.TextField()
    status = models.CharField(max_length=20, choices=[('pending', 'Pending'), 
                                                     ('confirmed', 'Confirmed'), 
                                                     ('completed', 'Completed'), 
                                                     ('cancelled', 'Cancelled')],
                              default='pending')

    def __str__(self):
        return f"{self.pet_name.pet_name} - {self.appointment_date.strftime('%Y-%m-%d')}"

    def save(self, *args, **kwargs):
        # Create a notification when the appointment status changes
        if self.pk is None:  # Only create notification when it's a new appointment
            super().save(*args, **kwargs)
            return
        
        previous = Appointment.objects.get(pk=self.pk)
        if previous.status != self.status:
            Notification.objects.create(
                user=self.user,
                message=f"Your appointment for {self.pet_name.pet_name} has been updated to {self.get_status_display()}.",
                appointment=self,
            )
        
        super().save(*args, **kwargs)


class Notification(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    message = models.TextField()
    is_read = models.BooleanField(default=False)
    appointment = models.ForeignKey(Appointment, on_delete=models.CASCADE)
    created_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f"Notification for {self.user.username} - {self.created_at}"



class MedicalRecord(models.Model):
    pet_name = models.ForeignKey(Pet, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True)
    notes = models.TextField()
    treatment = models.TextField()

    def __str__(self):
        return f"{self.pet.name} - {self.date.strftime('%Y-%m-%d')}"
    
class BillingTransaction(models.Model):
    pet_owner = models.ForeignKey('PetOwner', on_delete=models.CASCADE)
    appointment = models.ForeignKey('Appointment', on_delete=models.CASCADE)
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    proof_of_payment = models.ImageField(upload_to='payment_proofs/')
    status_choices = [
        ('pending', 'Pending'),
        ('approved', 'Approved'),
        ('rejected', 'Rejected'),
    ]
    status = models.CharField(max_length=10, choices=status_choices, default='pending')
    submitted_at = models.DateTimeField(default=timezone.now)
    verified_at = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"Transaction for {self.appointment.pet.name} - {self.get_status_display()}"
    
class TransactionReceipt(models.Model):
    transaction = models.OneToOneField(BillingTransaction, on_delete=models.CASCADE)
    issued_by = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)  # Admin user
    receipt_file = models.FileField(upload_to='transaction_receipts/')
    issued_at = models.DateTimeField(auto_now_add=True)
    notes = models.TextField(blank=True)

    def __str__(self):
        return f"Receipt for {self.transaction.appointment.pet.name} on {self.issued_at.strftime('%Y-%m-%d')}"