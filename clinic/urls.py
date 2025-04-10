# clinic/urls.py
from django.urls import path
from . import views
from django.contrib.auth.views import LoginView, LogoutView

urlpatterns = [
    path('register/', views.register, name='register'),  # Registration view
    path('login/', LoginView.as_view(template_name='clinic/login.html'), name='login'),
    path('logout/', LogoutView.as_view(next_page='login'), name='logout'),  # Still use this for GET and POST

    path('dashboard/', views.pet_owner_dashboard, name='pet_owner_dashboard'),
    path('notifications/', views.view_notifications, name='view_notifications'),

    path('appointment/<int:pk>/view/', views.view_appt_notif, name='view_appt_notif'),


    path('appointments/create/', views.create_appointment, name='create_appointment'),

    path('register_pet/', views.register_pet, name='register_pet'),
    path('pets/', views.pet_list, name='pet_list'),

    path('billing_transactions/', views.BillingTransactionListView.as_view(), name='billing-transaction-list'),
    path('billing_transactions/create/', views.BillingTransactionCreateView.as_view(), name='billing-transaction-create'),

    path('pet_list/', views.view_pets, name='pet_list'),

    path('appointment_list/', views.view_appointments, name='appointment_list'),
   
    path('medical_records_list/', views.view_medical_records, name='medical_records_list'),

]













'''
 path('appointments/', views.AppointmentListView.as_view(), name='appointment_list'),
 
from django.contrib.auth import views as auth_views  # Import Django's built-in auth views

 path('login/', auth_views.LoginView.as_view(template_name='clinic/login.html'), name='login'),  # Login view

 path('dashboard/', views.dashboard, name='dashboard'),

 path('appointments/', views.AppointmentListView.as_view(), name='appointment-list'),
    path('appointments/create/', views.AppointmentCreateView.as_view(), name='appointment-create'),
'''