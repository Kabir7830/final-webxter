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
    

class userOTP(models.Model):
    class Meta:
        db_table = "user_otp"

    otp = models.CharField(max_length=255)
    user = models.EmailField(unique=True)
    expiry = models.CharField(max_length=255)
    is_verified = models.BooleanField(default=False,null=True,blank=True)

class Courses(models.Model):
    class Meta:
        db_table = "Courses"
    
    course_name = models.CharField(max_length=300,unique=True)
    course_description = models.TextField()
    course_short_description = models.CharField(max_length=350)
    course_image = models.ImageField(upload_to="thumbnails/")
    course_syllabus = models.FileField(upload_to="course_syllabus/",default="")
    is_published = models.BooleanField(default=True)
    slug = models.SlugField(unique=True, blank=True)  # Ensure unique slugs and allow blank

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


