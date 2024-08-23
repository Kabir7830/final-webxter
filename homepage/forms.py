from django import forms
from .models import *

class CompanyForm(forms.ModelForm):
    class Meta:
        model = Company
        fields = "__all__"

class courseForm(forms.ModelForm):
    class Meta:
        model = Courses
        fields = [
            "course_name",
            "details",
            "course_short_description",
            "course_image",
            'course_syllabus',
            'is_published',
            'slug',
            'tags',
            'category'
        ]

class CarouselForm(forms.ModelForm):
    class Meta:
        model = CarouselImages
        fields = [
            'carousel_image',
            'carousel_description',
            'carousel_title',
            'carousel_redirect_link',
            'is_mobile',
        ]


class CompanyInfoForm(forms.ModelForm):
    class Meta:
        model = CompanyInfo
        fields = [
            'company_logo',
            'company_fav_icon',
            'company_name',
            'company_about_us',
        ]

class RequestCallBackForm(forms.ModelForm):
    class Meta:
        model = RequestCallBack
        fields = [
            "name",
            "email",
            "message",
            "phone_number",
            "is_opened",
        ]


class RequestCallbackAPIForm(forms.ModelForm):
    class Meta:
        model = RequestCallBack
        fields = "__all__"

class CoachingForm(forms.ModelForm):
    class Meta:
        model = Coaching
        fields = [
            'subject',
            'classes',
            'mode',
            'timings',
            'description',
            'short_description',
            'image',
            'is_published',
            'slug',
        ]
        
class NotesForm(forms.ModelForm):
    class Meta:
        model = Notes
        fields = [
            "notes_title",
            "notes",
            "edited_on",
        ]


class BlogsForm(forms.ModelForm):
    class Meta:
        model = Blogs
        fields = [
            "blog_title",
            "blog_content",
            "edited_on",
            "is_published",
        ]

class CourseCategoryForm(forms.ModelForm):

    class Meta:
        model = CourseCategories
        fields = [
            'name'
        ]


class AdminCoursefrom(forms.ModelForm):
    class Meta:
        model = Courses
        fields = "__all__"
        exclude = ['category']
        slug = forms.SlugField()


class BannerForm(forms.ModelForm):
    class Meta:
        model = CarouselImages
        fields = "__all__"