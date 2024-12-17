from django.urls import path
from .views import *

urlpatterns = [
    path('courses/',CoursesAPi.as_view(),name="course-api"),
    path('company/',CompanyDetails.as_view()),
]
