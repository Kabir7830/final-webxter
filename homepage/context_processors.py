from .models import *
from django.shortcuts import render
import random

def Collection(request):
   
    company = Company.objects.all()
    notifications = 0
    banners = CarouselImages.objects.all()
    desktop_banners = CarouselImages.objects.filter(is_mobile = False)
    course_categories = CourseCategories.objects.all()
    mobile_banners = CarouselImages.objects.filter(is_mobile = True)
    new_enrolled_students = EnrolledStudents.objects.filter(is_read = False)
    new_requests = RequestCallBack.objects.filter(is_opened = False)


    notifications += len(new_enrolled_students) + len(new_requests)
    context = {
        "company":company.first(),
        "notifications":notifications,
        "mobile_banners":mobile_banners,
        "desktop_banners":desktop_banners,
        "course_categories":course_categories,
    }
    return context
