# clinic/consumers.py
import json
from channels.generic.websocket import AsyncWebsocketConsumer

class NotificationConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.user = self.scope["user"]
        if self.user.is_authenticated:
            self.group_name = f"user_{self.user.id}"
            await self.channel_layer.group_add(self.group_name, self.channel_name)
            await self.accept()
        else:
            await self.close()

    async def disconnect(self, close_code):
        # Remove the user from the group on disconnect
        await self.channel_layer.group_discard(self.group_name, self.channel_name)

    async def receive(self, text_data):
        # Handle any incoming messages (optional for your use case)
        pass

    # Method to handle sending notification messages to WebSocket
    async def send_notification(self, event):
        # Send the message to WebSocket
        await self.send(text_data=json.dumps({
            "message": event["message"]
        }))
