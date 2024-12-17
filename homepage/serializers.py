from rest_framework import serializers
from .models import *


class CompanySerializer(serializers.ModelSerializer):
    class Meta:
        model = Company
        fields = "__all__"

class CoursesSerializer(serializers.ModelSerializer):

    class Meta:
        model = Courses
        fields = "__all__"

    
        
class CourseFormAPISerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Courses
        fields = ["id","course_name"]

class DemoRegisterationSerializer(serializers.ModelSerializer):
    date_slot = serializers.DateField(format="%d-%m-%Y", input_formats=["%d-%m-%Y", "%Y-%m-%d"])
    date_of_birth = serializers.DateField(format="%d-%m-%Y", input_formats=["%d-%m-%Y", "%Y-%m-%d"])
    class Meta:
        model = DemoClassRegistration 
        fields = "__all__"       

        
class AdminTimeSlotSerializer(serializers.ModelSerializer):
    class Meta:
        model = TimeSlots
        fields = "__all__"
        

class DemoTimeSlotsSerializer(serializers.ModelSerializer):
    class Meta:
        model = TimeSlots
        fields = ['id','start_slot','end_slot']
        
        
class RegistrationFormSerializer(serializers.ModelSerializer):
    class Meta:
        model = RegisterationForm
        fields = "__all__"
        
        
class AdminBatchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Batches
        fields = "__all__"
        
class BatchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Batches
        fields = ['id','name']
        
        
class CourseCategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = CourseCategories
        fields = "__all__"


class BannerSerializer(serializers.ModelSerializer):
    class Meta:
        model = CarouselImages
        fields = "__all__"


class AdminMarkdownFileSerializer(serializers.ModelSerializer):
    class Meta:

        model = MarkDownFiles
        fields = "__all__"
