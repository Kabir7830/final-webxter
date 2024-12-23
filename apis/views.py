from django.shortcuts import render
from homepage.models import *
import homepage.serializers as homeserializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import *


class CompanyDetails(APIView):
    def get(self,request):

        company = Company.objects.first()
        serializer_class = homeserializer.CompanySerializer(company)
        return Response(serializer_class.data,status=status.HTTP_200_OK)


class CoursesAPi(APIView):

    def get(self,request):
        query = request.GET.get('featured')
        courses = Courses.objects.filter(is_published = True)
        if query:
            courses = courses.filter(is_featured = True)
            
        serializer_class = homeserializer.CoursesSerializer(courses,many=True)

        return Response({"data":serializer_class.data,"message":"","status":"success"})
    

class CertificateVerfication(APIView):

    def post(self,request):

        certificateNumber = request.data.get('certificate_number')
        dateOfBirth = request.data.get("date_of_birth")

        certificate = Certificate_IDS.objects.filter(certificate_number=certificateNumber).filter(student__date_of_birth = dateOfBirth).first()

        if (certificate):
            serializer_class = CertificateVerficationSerializer(certificate)

            return Response({"data":serializer_class.data,"message":"","status":status.HTTP_200_OK})
        return Response({"data":None,"message":"No Certificate Found","status":status.HTTP_404_NOT_FOUND})


class NewsletterSubscribeAPI(APIView):

    def post(self,request):

        email = request.data.get('email')
        data = {
            "email" :email,
            "subscribed":True
        }

        newsletter = NewsletterSubscribers.objects.filter(email = email)

        if newsletter.filter(subscribed = True).first() is not None:
            return Response({"data":[],"message":"Already Subscribed","status":status.HTTP_409_CONFLICT})
        
        if newsletter.first() is not None:

            newsletter.update(
                subscribed = 1
            )
            return Response({"data":[],"message":"Subscribed","status":status.HTTP_200_OK})

        newsletter = NewseletterSubscribersSerializer(data=data)

        if newsletter.is_valid():
            newsletter.save()
            return Response({"data":[],"message":"Subscribed","status":status.HTTP_200_OK})
        else:
        
            return Response({"data":newsletter.errors,"message":"Please Enter a valid email address    ",'status':status.HTTP_406_NOT_ACCEPTABLE})
        


class NewsletterUnsubscribeAPI(APIView):

    def post(self,request):

        email = request.data.get('email')

        newsletter = NewsletterSubscribers.objects.filter(email = email)
        
        if newsletter.filter(subscribed = True).first():
            newsletter.update(
                subscribed = 0
            )
            return Response({"data":[],"message":"UnSubscribed","status":status.HTTP_200_OK})

        return Response({"data":[],"message":"Email not subscribed","status":status.HTTP_404_NOT_FOUND})


        



