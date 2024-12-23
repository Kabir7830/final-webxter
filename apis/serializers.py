from rest_framework import serializers
from homepage.models import *

class CertificateVerficationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Certificate_IDS
        fields = "__all__" 

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        # Replace student_id with the student object
        representation['student'] = {
            'name': f"{instance.student.first_name} {instance.student.last_name}",  # Adjust 'name' to the actual field in CompanyUser
            'email': instance.student.email
        }
        # Replace course with the course object
        representation['course'] = {
            'id': instance.course.id,
            'name': instance.course.course_name,
        }
        return representation
    

class NewseletterSubscribersSerializer(serializers.ModelSerializer):

    class Meta:
        model = NewsletterSubscribers
        fields = "__all__" 