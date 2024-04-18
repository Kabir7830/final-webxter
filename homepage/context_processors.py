from .models import *
from django.shortcuts import render
import random

def Collection(request):
   
    company = Company.objects.all()
    context = {
        "company":company.first(),
    }
    return context
