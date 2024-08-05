from django.db import models
from django.contrib.auth.models import User
# Create your models here.
from django.contrib.auth.models import BaseUserManager, AbstractUser
from django.utils.text import slugify
import random
import string



class Company(models.Model):
    class Meta:
        db_table = "company"
        verbose_name = 'Company'
        verbose_name_plural = 'Companies'
    name = models.CharField(max_length=255)
    description = models.TextField(null=True,blank=True)
    email = models.CharField(max_length = 255)
    phone_number = models.CharField(max_length = 14)
    logo = models.ImageField(upload_to='logo/',null=True,blank=True)
    favicon = models.ImageField(upload_to='favicon/',null=True,blank=True)
    address = models.CharField(max_length = 255,null=True,blank=True)
    currency_symbol = models.TextField(blank=True,default="₹")

    def __str__(self):
        return self.name


class CustomUserManager(BaseUserManager):
    
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('The Email field must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        return self.create_user(email, password, **extra_fields)


class CompanyUser(AbstractUser):
    username = None  # Remove the username field

    email = models.EmailField(unique=True)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)

    # Add your additional fields here
    date_of_birth = models.DateField(null=True, blank=True)
    security_question_1 = models.TextField()
    security_question_2 = models.TextField()
    security_question_1_answer = models.CharField(max_length=300)
    security_question_2_answer = models.CharField(max_length=300)
    is_verified = models.BooleanField(default=False,null=True,blank=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name', 'last_name']  # Add any other required fields

    objects = CustomUserManager()

    def __str__(self):
        return self.email
    

class StudentID(models.Model):
    
    class Meta:
        db_table = "students_id"
        
    student = models.ForeignKey(to=CompanyUser,on_delete=models.PROTECT,unique=True)
    webxter_student_id = models.IntegerField()


class userOTP(models.Model):
    class Meta:
        db_table = "user_otp"

    otp = models.CharField(max_length=255)
    user = models.EmailField(unique=True)
    expiry = models.CharField(max_length=255)
    is_verified = models.BooleanField(default=False,null=True,blank=True)


class CourseCategories(models.Model):
    class Meta:
        db_table = "course_categories"

    name = models.CharField(max_length=255,unique=True)


class Courses(models.Model):
    class Meta:
        db_table = "Courses"
    
    course_name = models.CharField(max_length=300,unique=True)
    summary = models.CharField(max_length=200,default="")
    overview = models.TextField(default="")
    details = models.TextField(default="")
    curriculum = models.TextField(default="")
    benefits = models.TextField(default="")
    featured_image = models.ImageField(upload_to="featured_images/",default="")

    course_short_description = models.CharField(max_length=350)
    course_image = models.ImageField(upload_to="thumbnails/")
    course_syllabus = models.FileField(upload_to="course_syllabus/",default="")
    is_published = models.BooleanField(default=True)
    slug = models.SlugField(unique=True, blank=True)  # Ensure unique slugs and allow blank
    tags = models.TextField(default="",blank=True)
    category = models.ManyToManyField(CourseCategories,related_name="categories",blank=True,null=True)

    def save(self, *args, **kwargs):
        if not self.slug:  # If slug is not set
            self.slug = slugify(self.title)  # Generate slug from title
        super().save(*args, **kwargs)


class CarouselImages(models.Model):
    class Meta:
        db_table = "carousel_images"
    
    carousel_image = models.ImageField(upload_to='carousel_images/')
    carousel_title = models.CharField(max_length=100,null=True,blank=True,default="")
    carousel_description = models.CharField(max_length=300,null=True,blank=True,default="")
    carousel_redirect_link = models.TextField(default="#",blank=True)
    is_mobile = models.BooleanField(default=False,blank=True)


class CompanyInfo(models.Model):
    class Meta:
        db_table = "company_info"

    company_logo = models.ImageField(upload_to="logos/", null=True,blank=True)
    company_fav_icon = models.ImageField(upload_to='fav_icons/',null=True,blank=True)
    company_name = models.CharField(max_length=200,null=True,blank=True)
    company_about_us = models.TextField(null=True,blank=True)


class RequestCallBack(models.Model):
    class Meta:
        db_table = "request_call_back"

    name = models.CharField(max_length=400)
    email = models.EmailField()
    message = models.TextField()
    phone_number = models.CharField(max_length=15)
    date = models.CharField(max_length=30)
    time = models.CharField(max_length=30)
    is_opened = models.BooleanField(default=False)


class Coaching(models.Model):
    class Meta:
        db_table = "coaching"

    subject = models.CharField(max_length=100)
    classes = models.CharField(max_length=600)
    mode = models.CharField(max_length=20)
    timings = models.CharField(max_length=200)
    description = models.TextField(default="")
    short_description = models.CharField(max_length=200,default="")
    image = models.ImageField(upload_to="coaching_thumbnails/",default="")
    syllabus = models.FileField(upload_to="coaching_syllabus/",default="",null=True,blank=True)
    is_published = models.BooleanField(default=True)
    slug = models.SlugField(unique=True, blank=True)  # Ensure unique slugs and allow blank

    def save(self, *args, **kwargs):
        if not self.slug:  # If slug is not set
            self.slug = slugify(self.title)  # Generate slug from title
        super().save(*args, **kwargs)


class EnrolledStudents(models.Model):
    class Meta:
        db_table = "enrolled_students"

    student_id = models.ForeignKey(CompanyUser,on_delete=models.CASCADE)
    course_id = models.ForeignKey(Courses,on_delete=models.CASCADE)
    enrolled_date = models.CharField(max_length=60,default="")
    enrolled_time = models.CharField(max_length=60,default="")
    is_read = models.BooleanField(default=False,blank=True)


class Certificate_IDS(models.Model):
    class Meta:
        db_table = "certificate_ids"
    
    student_id = models.ForeignKey(CompanyUser,on_delete=models.CASCADE,unique=True)
    certificate_number = models.CharField(max_length=40,unique=True)
    
    
class Notes(models.Model):
    class Meta:
        db_table = "notes"

    user_id = models.ForeignKey(CompanyUser,on_delete=models.CASCADE)
    notes_title = models.CharField(max_length=60)
    notes = models.TextField()
    written_on = models.CharField(max_length=60,default="")
    edited_on = models.CharField(max_length=60,default="")
    slug = models.SlugField(unique=True, blank=True)  # Ensure unique slugs and allow blank

    def save(self, *args, **kwargs):
        if not self.slug:  # If slug is not set
            base_slug = slugify(self.notes_title)  # Generate base slug from title
            self.slug = base_slug  # Assign base slug initially
            suffix = 1
            while Notes.objects.filter(slug=self.slug).exists():
                # If a model with this slug already exists, append a random suffix
                self.slug = f"{base_slug}-{self._generate_random_suffix(suffix)}"
                suffix += 1
        super().save(*args, **kwargs)

    def _generate_random_suffix(self, length):
        return ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))


class Blogs(models.Model):
    class Meta:
        db_table = "blogs"
    
    user_id = models.ForeignKey(CompanyUser,on_delete=models.CASCADE)
    blog_title = models.CharField(max_length=60)
    blog_content = models.TextField()
    written_on = models.CharField(max_length=60,default="",null=True)
    edited_on = models.CharField(max_length=60,default="")
    is_published = models.BooleanField(default=True)
    slug = models.SlugField(unique=True, blank=True)  # Ensure unique slugs and allow blank

    def save(self, *args, **kwargs):
        if not self.slug:  # If slug is not set
            base_slug = slugify(self.blog_title)  # Generate base slug from title
            self.slug = base_slug  # Assign base slug initially
            suffix = 1
            while Blogs.objects.filter(slug=self.slug).exists():
                # If a model with this slug already exists, append a random suffix
                self.slug = f"{base_slug}-{self._generate_random_suffix(suffix)}"
                suffix += 1
        super().save(*args, **kwargs)

    def _generate_random_suffix(self, length):
        return ''.join(random.choices(string.ascii_lowercase + string.digits, k=length))


class TimeSlots(models.Model):
    class Meta:
        db_table = "time_slots"
        
    start_slot = models.TimeField()
    end_slot = models.TimeField()
    is_available = models.BooleanField(default=True,blank=True)
    is_for_demo = models.BooleanField(default=False,blank=True)
    

class DemoClassRegistration(models.Model):

    class Meta:
        db_table = "demo_class_registeration"


    name = models.CharField(max_length=255)
    email = models.EmailField()
    date_of_birth = models.DateField(default="2020-02-02")
    gender = models.CharField(max_length=100,default="")
    course = models.ForeignKey(Courses,on_delete=models.PROTECT)
    contact_number = models.CharField(max_length=15)
    alternate_number = models.CharField(max_length=15,null=True,blank=True)
    time_slot = models.ForeignKey(to=TimeSlots,on_delete=models.PROTECT)
    date_slot = models.CharField(max_length=30,default="")


class Batches(models.Model):
    class Meta:
        db_table = "batches"
        
    name = models.CharField(max_length=150) # a name for the batch
    start_date = models.DateField() # course start date
    end_date = models.DateField() # course end date
    start_time = models.TimeField() # daily class start time
    end_time = models.TimeField() # daily class end time
    duration = models.DateField() # how long the is course is 1 month, 2 months etc 
    is_expired = models.BooleanField(default=False,blank=True)

    
class RegisterationForm(models.Model):
    
    class Meta:
        db_table = "registeration_form"
    
    # personal
    name = models.CharField(max_length=255)
    email = models.EmailField()
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=100)
    contact_number = models.CharField(max_length=15)
    alternate_number = models.CharField(max_length=15,default="",null=True,blank=True)
    
    # Academic information
    student_id = models.CharField(max_length=255,null=True,blank=True,default="")
    highest_education_qualification = models.CharField(max_length=600)
    institute_name = models.CharField(max_length=600)
    
    # course information
    course = models.ForeignKey(to=Courses,on_delete=models.PROTECT)
    batch = models.ForeignKey(to=Batches,on_delete=models.PROTECT)
    
    # prerequisite information
    privious_courses = models.TextField(null=True,blank=True,default="")
    relevant_certifications = models.TextField(blank=True,null=True,default="")
    
    # webxter's student
    is_returning_student = models.BooleanField(default=False,blank=True)
    webxter_student_id = models.CharField(max_length=20,null=True,blank=True,default="")
    
    # Emergency Information
    emergency_contact_name = models.CharField(max_length=255)
    emergency_contact_number = models.CharField(max_length=15)
    emergency_contact_relationship = models.CharField(max_length=500)
    


    