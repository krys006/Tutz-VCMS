from django.contrib import admin
from .models import PetOwner, Pet, Appointment, MedicalRecord, BillingTransaction, TransactionReceipt
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync

admin.site.register(PetOwner)
admin.site.register(Pet)
admin.site.register(MedicalRecord)
admin.site.register(BillingTransaction)
admin.site.register(TransactionReceipt)

@admin.register(Appointment)
class AppointmentAdmin(admin.ModelAdmin):
    list_display = ('pet_name', 'appointment_date', 'time', 'status')
    list_filter = ('status', 'appointment_date')
    search_fields = ('pet__name', 'pet_owner__user__username')

    def save_model(self, request, obj, form, change):
        # Store the original status before saving
        original_status = None
        if obj.pk:
            original = Appointment.objects.get(pk=obj.pk)
            original_status = original.status

        # Save the appointment
        super().save_model(request, obj, form, change)

        # If status has changed to "Cancelled", trigger notification
        if original_status != obj.status and obj.status.lower() == 'cancelled':
            pet_owner = obj.pet_name.owner  # assuming pet_name is a FK to Pet and Pet has owner FK to User

            channel_layer = get_channel_layer()
            async_to_sync(channel_layer.group_send)(
                f"user_{pet_owner.id}",  # or pet_owner.user.id if PetOwner links to User model
                {
                    "type": "send_notification",
                    "message": f"Your appointment for {obj.pet_name.pet_name} on {obj.appointment_date} at {obj.time} has been cancelled."
                }
            )
