from django.contrib import admin
from .models import PetOwner, Pet, Appointment, MedicalRecord, BillingTransaction, TransactionReceipt

admin.site.register(PetOwner)
admin.site.register(Pet)
'''admin.site.register(Appointment)'''
admin.site.register(MedicalRecord)
admin.site.register(BillingTransaction)
admin.site.register(TransactionReceipt)

@admin.register(Appointment)
class AppointmentAdmin(admin.ModelAdmin):
    list_display = ('pet_name', 'appointment_date', 'time', 'status')       # Columns to show
    list_filter = ('status', 'appointment_date')                       # Sidebar filters
    search_fields = ('pet__name', 'pet_owner__user__username')  # Search bar