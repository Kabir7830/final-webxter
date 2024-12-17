from django.shortcuts import render
from homepage.models import *
import homepage.serializers as homeserializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class CompanyDetails(APIView):
    def get(self,request):

        company = Company.objects.first()
        serializer_class = homeserializer.CompanySerializer(company)
        return Response(serializer_class.data,status=status.HTTP_200_OK)


class CoursesAPi(APIView):

    def get(self,request):

        courses = Courses.objects.filter(is_published = True)
        serializer_class = homeserializer.CoursesSerializer(courses,many=True)

        return Response({"data":serializer_class.data,"message":"","status":"success"})

