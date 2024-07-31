from rest_framework import serializers
from .models import *


class CoursesSerializer(serializers.ModelSerializer):

    class Meta:
        model = Courses
        fields = "__all__"

