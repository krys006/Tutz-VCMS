# clinic/signals.py
from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Appointment
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync

@receiver(post_save, sender=Appointment)
def notify_user_on_new_appointment(sender, instance, created, **kwargs):
    if created:
        # When an appointment is created, send a notification to the user
        channel_layer = get_channel_layer()
        async_to_sync(channel_layer.group_send)(
            f"user_{instance.user.id}",  # Send to the user's group
            {
                "type": "send_notification",
                "message": f"New appointment for {instance.pet_name} scheduled on {instance.appointment_date}.",
            }
        )

def send_notification(user_id, message):
    channel_layer = get_channel_layer()
    async_to_sync(channel_layer.group_send)(
        f"user_{user_id}",
        {
            "type": "send_notification",
            "message": message,
        },
    )