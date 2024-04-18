from django.urls import path
from .views import *

urlpatterns = [
    path("",homepage),
    path("cal-values/", calculate_values),
    path("cal-dvs/", DVCalculator)
]