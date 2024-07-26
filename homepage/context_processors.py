from .models import *
from django.shortcuts import render
import random

def Collection(request):
   
    company = Company.objects.all()
    notifications = 0

    new_enrolled_students = EnrolledStudents.objects.filter(is_read = False)
    new_requests = RequestCallBack.objects.filter(is_opened = False)


    notifications += len(new_enrolled_students) + len(new_requests)
    context = {
        "company":company.first(),
        "notifications":notifications,
    }
    return context
