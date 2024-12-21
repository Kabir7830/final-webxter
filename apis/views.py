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



