from django.shortcuts import render,redirect
from .forms import *
from django.contrib import messages
from django.db.models import Q
from django.contrib.auth import login,logout,authenticate,get_user_model
import smtplib
from email.mime.text import MIMEText
import random
from email.mime.multipart import MIMEMultipart
from .pagination import *
from .email_templates import (otpTemplate,
                              signup_template,
                              EnrollmentTemplate
                              ,CallbackRequestTemplate,
                              DemoClassRegestrationTemplate,
                              AdminDemoClassRegestrationTemplate,
                              certificate_validation_template,
                              certificate_invalidation_template,
                              admin_template)
from rest_framework.views import APIView
from rest_framework.response import Response
from datetime import datetime,timedelta
import logging
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from .serializers import *
from .utils import *
User = get_user_model()

logger = logging.getLogger("otp")

credentials_file = open('homepage/credentials.txt','r')
for line in credentials_file:
    credentials = eval(line)
    break

def Error404(request):
    return render(request,"error/404.html")

def Error500(request):
    return render(request,"error/500.html")

def AdminDashboard(request):
    if is_admin(request):
        return render(request,"homepage/admin_dashboard.html")
    return redirect('404')


class otpAPI(APIView):
    def post(self,request):
        logger.debug("This is a debug message")
        try:
            data = request.data
            print(data)
            email = data.get('email')
            subject = "Account Verification - Webxter"
            otp = random.randint(1000,9999)
            body = otpTemplate(otp=otp,email=email)
            recipients = [email]
            current_datetime = datetime.now()
            new_datetime = current_datetime + timedelta(minutes=5)
            formatted_new_datetime = new_datetime.strftime("%Y-%m-%d %H:%M:%S")
            
            existing_user = userOTP.objects.filter(user = email)
            existing_signedup_user = User.objects.filter(email = email)
            if existing_user.first() is not None and existing_user.first().is_verified and existing_signedup_user.first():
                return Response({"message":"User Already Registered","status":"error","is_verified":"true"})
            elif existing_user.first() is not None and not(existing_user.first().is_verified):
                otp_instance = existing_user.update(
                    otp = otp,
                    expiry = formatted_new_datetime,
                    is_verified = False,
                )
                send_email(subject, body, recipients,sender_name="Account Verification")
                return Response({"message":"otp send","status":"success","is_verified":"false"})
            elif existing_user.first() is not None and existing_user.first().is_verified:
                 return Response({"message":"Email Verified ✅","status":"success","is_verified":"true"})
            
            otp_instance = userOTP.objects.create(
                otp = otp,
                user = email,
                expiry = formatted_new_datetime,
                is_verified = False,
            )
            send_email(subject, body, recipients,sender_name="Account Verification")
            return Response({"message":"otp send","status":"success","is_verified":"false"})
        except Exception as e:
            print(e)
            logger.error("An error occurred: %s", e)
            logger.exception("Exception traceback:")
            return Response({"message":"Couldn't Send OTP. Server error!","status":"error"})


class verifyOTP(APIView):

    def post(self,request):
        try:
            data = request.data
            user_otp = data.get('user_otp')
            current_datetime = datetime.now()
            formatted_datetime = current_datetime.strftime("%Y-%m-%d %H:%M:%S")
            otp_instance = userOTP.objects.filter(user = data.get('email'))
            if otp_instance is None:
                return Response({"message":"Email Verification Failed","status":"error"})
            if str(user_otp) == str(otp_instance.first().otp): 
                if str(formatted_datetime) < str(otp_instance.first().expiry):
                    otp_instance.update(

                        is_verified = True,
                    )
                    return Response(({"message":"Email Verified ✅","status":"success","is_verified":"true"}))
                else:
                    return Response(({"message":"OTP Expired","status":"error","is_verified":"false"}))
            else:
                return Response(({"message":"Invalid OTP","status":"error","is_verified":"false"}))
            return Response()
        except Exception as e:
            print(e)
            return Response({"message":"Verification Failed","status":"error","is_verified":"false"})

 
def send_email(subject, body, recipients,sender_name="Webxter"):
    sender = credentials['SENDER']
    password = credentials['PASSWORD']
    sender_name = sender_name
    msg = MIMEMultipart()
    msg['Subject'] = subject
    msg['To'] = ', '.join(recipients)
    msg['From'] = f'{sender_name} <{sender}>'
    html_body = MIMEText(body, 'html')
    msg.attach(html_body)
    with smtplib.SMTP_SSL(credentials['HOST'], credentials['PORT']) as smtp_server:
       smtp_server.login(sender, password)
       smtp_server.sendmail(sender, recipients, msg.as_string())
    print("Message sent!")


def adminHomepage(request):
    if request.user.is_superuser:
        return render(request,"masters/admin-master.html")
    else:
        return render(request,"access-denied.html")


def openZoho(request):
    return render(request,"verifyforzoho.html")


def homepage(request):
    coachings = Coaching.objects.all()[:9]
    banners = CarouselImages.objects.all()
    courses = Courses.objects.filter(is_published = True)
    return render(request,"index.html",{"courses":courses,"banners":banners,"coachings":coachings})


def aboutUs(request):
    return render(request,"about-us.html")


def privacyPolicy(request):
    return render(request,"privacy-policy.html")


def getAllCourses(request):
    courses = Courses.objects.filter(is_published = True)
    query = request.GET.get('q')
    category = request.GET.get('category')
    if category:
        courses = courses.filter(category__name__icontains = category)
    if query:
        courses = courses.filter(Q(tags__icontains = query) | Q(course_name__icontains = query))
    courses_per_page = 6
    paginator = Paginator(courses, courses_per_page)
    page = request.GET.get('page')
    try:
        objects = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        objects = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        objects = paginator.page(paginator.num_pages)
    number_of_courses = len(courses)
    current_number_of_courses = len(objects)
    return render(request, 'courses/courses.html', {'courses': objects,
                                                    "number_of_courses":number_of_courses,
                                                    "current_number_of_courses":current_number_of_courses,
                                                    "courses_per_page":courses_per_page,
                                                    "query":query,
                                                    "ctgry":category,
                                                    })
    # return render(request,"courses/courses.html",{'courses':courses})


class CoursesAPI(APIView):
    
    page_size = 8
    page_size_query_param = 'page_size'
    max_page_size = 100


    def get(self,request):
        
        courses = Courses.objects.filter(is_published=True)
        
        query = request.GET.get('q')
        category = request.GET.get('category')
        page_size = request.GET.get('page_size')
        if page_size:
            self.page_size = int(page_size)
        if category:
            courses = courses.filter(category__name__icontains = category)
        if query:
            courses = courses.filter(Q(tags__icontains = query) | Q(course_name__icontains = query))
        paginator = CustomPagination()
        paginator.page_size = self.page_size
        result_page = paginator.paginate_queryset(courses, request)
        serializer = CoursesSerializer(result_page, many=True)
        page_size = self.page_size
        return paginator.get_paginated_response({"data":serializer.data,"message":"","status":"success","page_size":page_size})


class CourseForFormAPI(APIView):
    
    def get(self,request):
        
        courses = Courses.objects.filter(is_published = True).values('id','course_name')
        serializer_class = CourseFormAPISerializer(courses,many=True)
        return Response({"data":serializer_class.data,"message":'',"status":'success'})
        

def AddCompany(request):
    if is_admin(request):
        form = CompanyForm()
        existing_company = Company.objects.all()
        if existing_company.exists():
            return redirect('edit-company')
        if is_method_post(request):
            
            form = CompanyForm(request.POST,request.FILES)
            if form.is_valid():
                form.save()
                messages.success(request,"Added")
                return redirect('edit-company')
        return render(request,"add/company.html")
    return redirect('404')


def EditCompany(request):
    if is_admin(request):
        company = Company.objects.all().first()
        if is_method_post(request):
            form = CompanyForm(request.POST,request.FILES,instance=company)
            if form.is_valid():
                form.save()
                messages.success(request,"updated")
                return redirect(request.META.get('HTTP_REFERER'))
            print(form.errors)
            return redirect('500')
        return render(request,"edit/company.html",{"company":company})
    return redirect('404')


def addCourse(request):
    if request.user.is_superuser:
        if request.method == "POST":
            try:
                course = Courses.objects.create(
                    course_name = request.POST.get('course_name'),
                    course_description = request.POST.get('course_description'),
                    course_short_description = request.POST.get('course_short_description'),
                    course_image = request.FILES.get('course_image'),
                    course_syllabus = request.FILES.get('course_syllabus'),
                    is_published = request.POST.get('is_published'),
                    slug = request.POST.get('slug'),
                    tags = request.POST.get('tags'),
                )
                categories = request.POST.get('categories')
                if categories:
                    categories = eval(categories)
                    for category in categories:
                        ctg = CourseCategories.objects.filter(id = category).first()
                        course.categories.add(ctg)
                course.save()
                messages.success(request,"added")
                return redirect(request.META.get('HTTP_REFERER'))
            except Exception as e:
                print(e)
                messages.error(request,"something went wrong! Try again")
                return redirect(request.META.get('HTTP_REFERER'))
        return render(request,"add/course.html")
    else:
        return render(request,"access-denied.html")


class AdminCourses(APIView):
    
    def get(self,request):
        courses = Courses.objects.all()
        serializer_class = CoursesSerializer(courses,many=True)
        return Response({"data":serializer_class.data,"message":"","status":"success"})
    
    def post(self,request):
        
        data = request.data
        print(data)
        serializer_class = CoursesSerializer(data=data)
        if serializer_class.is_valid():
            serializer_class.save()
            return Response({"data":serializer_class.data,"message":"course Added","status":"success"})
        return Response({"data":[],"message":serializer_class.errors,"status":"error"})
    
    def put(sel,request):
        
        data = request.data
        course = Courses.objects.filter(id = data.get('course_id')).first()
        serializer_class = AdminCoursefrom(request.POST,request.FILES,instance=course)
        
        if serializer_class.is_valid():
            categories = eval(request.POST.get('category'))
            print("md = ",request.POST.get('markdown_file'))
            if request.POST.get('markdown_file'):
                md = eval(request.POST.get('markdown_file'))
            else:
                md=False
            serializer_class.save()
            for category in categories:
                catgry = CourseCategories.objects.filter(id = category).first()
                course.category.add(catgry)
                course.save()
            if (md):
                if type(md) == int:
                    file = MarkDownFiles.objects.filter(id = md).first()
                    course.markdown_file.add(file)
                    course.save()
                else:
                    for md_file in md:
                        file = MarkDownFiles.objects.filter(id = md_file).first()
                        course.markdown_file.add(file)
                        course.save()   
            return Response({"data":serializer_class.data,"message":"Updated","status":"success"})
        return Response({"data":[],"message":serializer_class.errors,"status":"error"})
    
    def delete(self,request):
        
        data = request.data
        course = Courses.objects.filter(id = data.get('course_id')).first()
        if course is None:
            return Response({"data":[],"message":"No Course found to delete","status":"success"})
        try:
            course.delete()
            return Response({"data":[],"message":"Deleted","status":"success"})
        except Exception as e:
            return Response({"data":[],"message":f"{e}","status":"error"})


class AdminMarkdownAPI(APIView):

    def get(self,request):

        markdown_files = MarkDownFiles.objects.all()
        serializer_class = AdminMarkdownFileSerializer(markdown_files,many=True)
        return Response({"data":serializer_class.data,"message":"","status":"success"})
    
    def post(self,request):

        form = AdminMarkdownFileForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return Response({"data":[],"message":"Added","status":"success"})
        return Response({"data":[],"message":form.errors,"status":"error"})
    
    def put(self,request):

        md_file = MarkDownFiles.objects.filter(id = request.POST.get('markdown_file_id')).first()
        form = AdminMarkdownFileForm(request.POST,request.FILES,instance=md_file)
        if form.is_valid():
            form.save()
            return Response({"data":[],"message":"updated","status":"success"})
        return Response({"data":[],"message":form.errors,"status":"error"})


def addMarkdownFile(request):
    if is_admin(request):
        return render(request,"add/markdown.html")
    return redirect('500')


def addCourseTemplate(request):
    
    if is_admin(request):
        return render(request,"add/course.html")            


def editCourse(request,course_id):
    if request.user.is_superuser:
        form = courseForm()
        course = Courses.objects.filter(id = course_id)
        if request.method == "POST":
            print("categories = ",request.POST.get('category'))
            form = courseForm(request.POST,request.FILES,instance=course.first())
            if form.is_valid():
                course = form.save(commit=False)
                categories = request.POST.getlist('categories')
                print(categories)
                course.category.set(categories)
                course.save()
                messages.success(request,"updated")
                return redirect(request.META.get("HTTP_REFERER"))
            else:
                print(form.errors)
                messages.error(request,f"{form.errors}")
                return redirect(request.META.get("HTTP_REFERER"))
        return render(request,"edit/course.html",{"course":course.first()})
    else:
        return render(request,"access-denied.html")


def allCourses(request):
    if request.user.is_superuser:
        courses = Courses.objects.all()
        category = request.GET.get('category')
        if category:
            print(category)
            courses = courses.filter(category__name__icontains = category)
        return render(request,"all-courses.html",{'courses':courses})
    return redirect(request.META.get('HTTP_REFERER'))


def deleteCourse(request,course_id):
    if request.user.is_superuser:
        if request.method == "POST":
            try:
                course = Courses.objects.filter(id = course_id)
                course.delete()
                messages.success(request,"deleted")
                return redirect(request.META.get("HTTP_REFERER"))
            except Exception as e:
                print(e)
                messages.error(request,"something went wrong! Try Again")
                return redirect(request.META.get("HTTP_REFERER"))
        return redirect(request.META.get("HTTP_REFERER"))
    else:
        return render(request,"access-denied.html")


class CourseCategoryAPI(APIView):
    
    def get(self,request):
        
        categories = CourseCategories.objects.all()
        if categories is None:
            return Response({"data":[],"message":"No Categories. Add one to select.","status":"error"})
            
        serializer_class = CourseCategoriesSerializer(categories,many=True)
        
        return Response({"data":serializer_class.data,"message":"","status":"success"})


def addCourseCategory(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            try:
                category = CourseCategories.objects.create(
                    name = request.POST.get('name'),
                )
                category.save()
                messages.success(request,"Category Added")
                return redirect(request.META.get('HTTP_REFERER'))
            except Exception as e:
                print(e)
                messages.error(request,f"error - {e}")
                return redirect(request.META.get('HTTP_REFERER'))
        return render(request,"add/course_category.html")


def editCourseCategory(request,category_id):
    if request.user.is_authenticated:
        category = CourseCategories.objects.filter(id = category_id).first()
        if request.method == "POST":
            form = CourseCategoryForm(data= request.POST,instance=category)
            if form.is_valid():
                form.save()
                messages.success(request,"Category Updated")
                return redirect(request.META.get('HTTP_REFERER'))
            messages.error(request,f"Something went wrong {form.errors}")
            return redirect(request.META.get('HTTP_REFERER'))
        return render(request,"edit/course_category.html",{"category":category})


def addCarouselImage(request):
    if request.user.is_superuser:
       return render(request,"add/banner.html")
    else:
        return render(request,"access-denied.html")


class AdminBannerAPI(APIView):

    def get(self,request):
        banners = CarouselImages.objects.all()
        serializer_class = BannerSerializer(banners,many=True)
        return Response({"data":serializer_class.data,"message":"","status":"success"})
    
    def post(self,request):
        form = BannerForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return Response({"data":[],"message":"Added","status":"success"})
        return Response({"data":[],"message":form.errors,"status":"error"})

    def put(self,request):
        banner = CarouselImages.objects.filter(id = request.POST.get('carousel_image_id')).first()
        form = BannerForm(request.POST,request.FILES,instance=banner)
        if form.is_valid():
            form.save()
            return Response({"data":[],"message":"updated","status":"success"})
        return Response({"data":[],"message":form.errors,"status":"error"})
    



def editCarouselImage(request,carousel_id):
    if request.user.is_superuser:
        carousel = CarouselImages.objects.filter(id = carousel_id).first()
        return render(request,"edit/banner.html",{"carousel":carousel})
    else:
        return render(request,"access-denied.html")


def allBanners(request):
    if request.user.is_superuser:
        banners = CarouselImages.objects.all()
        return render(request,"all-banners.html",{'banners':banners})
    else:
        return render(request,"access-denied.html")


def deleteBanner(request,carousel_id):
    if request.user.is_superuser:

        if request.method == "POST":
            try:
                carousel = CarouselImages.objects.filter(id = carousel_id)
                carousel.delete()
                messages.success(request,"deleted")
                return redirect(request.META.get('HTTP_REFERER'))
            except Exception as e:
                print(e)
                messages.error(request,"something went wrong! Try Again")
                return redirect(request.META.get('HTTP_REFERER'))
        return redirect(request.META.get('HTTP_REFERER'))
    else:
        return render(request,"access-denied.html")


def addCompanyInfo(request):
    if request.user.is_superuser:
        if request.method == "POST":
            try:
                company_details = CompanyInfo.objects.create(
                    company_logo = request.FILES.get('company_logo'),
                    company_fav_icon = request.FILES.get('company_fav_icon'),
                    company_name = request.POST.get('company_name'),
                    company_about_us = request.POST.get('company_about_us'),
                )
                company_details.save()
                messages.success(request,"added")
                return redirect(request.META.get("HTTP_REFERER"))
            except Exception as e:
                print(e)
                messages.error(request,"something went worng! Try Again")
        return render(request,"add-company-info.html")
    else:
        return render(request,"access-denied.html")


def editCompanyInfo(request):
    if request.user.is_superuser:
        company = CompanyInfo.objects.first()
        form = CompanyInfoForm()
        if request.method == "POST":
            form = CompanyInfoForm(request.POST,request.FILES,instance=company)
            if form.is_valid():
                form.save()
                messages.success(request,"updated")
                return redirect(request.META.get('HTTP_REFERER'))
            else:
                print(form.errors)
                messages.error(request,f"{form.errors}")
                return redirect(request.META.get('HTTP_REFERER'))
        return render(request,"edit-company-info.html",{'company':company})
    else:
        return render(request,"access-denied.html")
        
            
def addRequestCallBack(request):
    if request.method == "POST":
        try:
            callback = RequestCallBack.objects.create(
                name = request.POST.get('name'),
                email = request.POST.get('email'),
                message = request.POST.get('message'),
                phone_number = request.POST.get('phone_number'),
                date = request.POST.get('date'),
                time = request.POST.get('time'),
            )
            callback.save()
            messages.success(request,"Request Made! We Will get in touch with you soon.")
            body = CallbackRequestTemplate(name=request.POST.get('name'),email=request.POST.get('email'),phone_number=request.POST.get('phone_number'),message=request.POST.get('message'))
            studentbody = CallbackRequestTemplate(name=request.POST.get('name'))
            # send_email(subject="New Callback Request",body=body,recipients=["kabir.behal7830@gmail.com"],sender_name="Webxter Callback Request")
            send_email(subject="Thankyou for Callback Request",body=studentbody,recipients=[request.POST.get('email')],sender_name="Webxter Callback Request")
            return redirect(request.META.get('HTTP_REFERER'))
        except Exception as e:
            print(e)
            messages.error(request,"something went wrong! Try again in sometime!")
            return redirect(request.META.get('HTTP_REFERER'))
    return redirect(request.META.get('HTTP_REFERER'))


class RequestCallbackAPI(APIView):

    def post(self,request):
        data = request.data
        form = RequestCallbackAPIForm(data=data)

        if form.is_valid():
            form.save()
            body = CallbackRequestTemplate(name=data.get('name'),email=data.get('email'),phone_number=data.get('phone_number'),message=data.get('message'))
            send_email(subject="Thankyou for Callback Request",body=body,recipients=[data.get('email')],sender_name="Webxter Callback Request")
            return Response({"data":[],"message":"Form Submitted","status":"success"})
        # return Response({"data":[],"message":f"{dict(form.errors)}","status":"error"})
        return Response({"data":[],"message":form.errors,"status":"error"})
        

def allRequestCallBack(request):
    if request.user.is_superuser:
        requests = RequestCallBack.objects.all()
        query = request.GET.get('query')
        if query:
            if str(query).lower() == "false":
                query = 0
            if str(query).lower() == "true":
                query = 1
            requests = requests.filter(Q(email__icontains= query) | Q(name__icontains = query) | Q(is_opened__icontains = query))
        
        return render(request,"all-requests.html",{'requests':requests})
    else:
        return render(request,"access-denied.html")


def deleteRequestCallBack(request,req_id):
    if request.user.is_superuser:
        if request.method == "POST":
            try:
                req = RequestCallBack.objects.filter(id = req_id)
                if not(req.first().is_opened):
                    messages.warning(request,"message have not marked as read!")
                    return redirect(request.META.get('HTTP_REFERER'))
                req.delete()
                messages.success(request,"deleted")
                return redirect(request.META.get('HTTP_REFERER'))
            except Exception as e:
                print(e)
                messages.error(request,"something went wrong! Try again in sometime")
                return redirect(request.META.get('HTTP_REFERER'))
        return redirect(request.META.get('HTTP_REFERER'))
    else:
        return render(request,"access-denied.html")


def makeRequestRead(request,req_id):
    if request.user.is_superuser:
        if request.method == "POST":
            try:
                req = RequestCallBack.objects.filter(id = req_id)
                req.update(
                    is_opened = True,
                )
                messages.success(request,'success')
                return redirect(request.META.get('HTTP_REFERER'))
            except Exception as e:
                print(e)
                messages.error(request,"soemthing went wrong! Try in sometime")
                return redirect(request.META.get('HTTP_REFERER'))
        return redirect(request.META.get('HTTP_REFERER'))
    else:
        return render(request,"access-denied.html")


def getCourseDetails(request,slug):
    student = 0
    if request.user.is_authenticated:
        student = EnrolledStudents.objects.filter(student_id = request.user.id).filter(course_id__slug = slug).first()

    course = Courses.objects.filter(slug = slug).first()
    markdown_contents = []
    for md_file in course.markdown_file.all():
        with md_file.file.open('r') as f:
            content = f.read()
            markdown_contents.append(content)
    # return render(request,"course-details.html",{'course':course,'student':student})
    return render(request,"details/course.html",{'course':course,'student':student,'markdown_contents': markdown_contents,})


def addCoaching(request):
    if request.user.is_superuser:
        if request.method == "POST":
            try:
                coaching = Coaching.objects.create(
                    subject = request.POST.get('subject'),
                    classes = request.POST.get('classes'),
                    mode = request.POST.get('mode'),
                    timings = request.POST.get('timings'),
                    description = request.POST.get('description'),
                    short_description = request.POST.get('short_description'),
                    image = request.FILES.get('image'),
                    is_published = request.POST.get('is_published'),
                    slug = request.POST.get('slug'),
                )
                coaching.save()
                messages.success(request,"success")
                return redirect(request.META.get("HTTP_REFERER"))
            except Exception as e:
                print(e)
                messages.error(request,"error")
                return redirect(request.META.get("HTTP_REFERER"))
        return render(request,"add-coaching.html")
    else:
        return render(request,"access-denied.html")


def getCoachingDetails(request,slug):
    coaching = Coaching.objects.filter(slug = slug).first()
    return render(request,"coaching-details.html",{'coaching':coaching})


def getCoachings(request):
    coachings = Coaching.objects.filter(is_published = True)
    return render(request,"coachings.html",{'coachings':coachings})


def editCoaching(request,coaching_id):
    if request.user.is_superuser:
        coaching = Coaching.objects.filter(id = coaching_id)
        form = CoachingForm()
        if request.method == "POST":
            try:
                form = CoachingForm(request.POST,request.FILES,instance=coaching.first())
                if form.is_valid():
                    form.save()
                    messages.success(request,"success")
                    return redirect(request.META.get("HTTP_REFERER"))
                else:
                    print(form.errors)
                    messages.error(request,f"{form.errors}")
                    return redirect(request.META.get("HTTP_REFERER"))
            except Exception as e:
                print(e)
                messages.error(request,"error")
                return redirect(request.META.get("HTTP_REFERER"))
        return render(request,"edit-coaching.html",{'coaching':coaching.first()})
    else:
        return render(request,"access-denied.html")


def deleteCoaching(request,coaching_id):
    if request.user.is_superuser:
        if request.method == "POST":
            try:
                coaching = Coaching.objects.filter(id = coaching_id)
                coaching.delete()
                messages.success(request,"success")
                return redirect(request.META.get("HTTP_REFERER"))
            except Exception as e:
                print(e)
                messages.error(request,"error")
                return redirect(request.META.get("HTTP_REFERER"))
        return redirect(request.META.get("HTTP_REFERER"))
    else:
        return render(request,"access-denied.html")


def getAllCoaching(request):
    if request.user.is_superuser:
        coachings = Coaching.objects.all()
        return render(request,"all-coachings.html",{'coachings':coachings})
    else:
        return render(request,"access-denied.html")


def SignUp(request):
    if request.method == "POST":
        try:
            verified_email = userOTP.objects.filter(user = request.POST.get('email'))
            if verified_email.first().is_verified:
                user = User.objects.create_user(
                    first_name = request.POST.get('first_name'),
                    last_name = request.POST.get('last_name'),
                    email = request.POST.get('email'),
                    security_question_1 = request.POST.get('security_question_1'),
                    security_question_1_answer = request.POST.get('security_question_1_answer'),
                    security_question_2 = request.POST.get('security_question_2'),
                    security_question_2_answer = request.POST.get('security_question_2_answer'),
                )
                user.set_password(request.POST.get('password'))
                user.save()
                subject = "Account Created - Webxter"
                otp = random.randint(1000,9999)
                body = signup_template(name=f"{request.POST.get('first_name')} {request.POST.get('last_name')}")
                recipients = [request.POST.get('email')]
                sender_name = "Account Created"
                send_email(subject, body, recipients,sender_name)
                messages.success(request,"Account Created.")
                return redirect('/login')
            else:
                messages.error(request,'email verification failed')
                return redirect(request.META.get('HTTP_REFERER'))
        except Exception as e:
            print(e)
            messages.error(request,"Error")
            return redirect(request.META.get('HTTP_REFERER'))
    return render(request,"signup.html")


def loginHandler(request):
    if request.method == "POST":
        try:
            email = request.POST.get('email')
            password = request.POST.get('password')
            user = authenticate(username=email, password= password)
            if user is not None:
                login(request,user)
                messages.success(request,"logged in")
                return redirect('/')
            else:
                messages.error(request,"Wrong Email or Password!")
                return redirect(request.META.get('HTTP_REFERER'))
        except Exception as e:
            print(e)
            messages.error(request,"error")
            return redirect(request.META.get('HTTP_REFERER'))
    return render(request,"login.html")


def LogoutHandler(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            logout(request)
            messages.success(request,"logged out")
            return redirect('/')
        return redirect(request.META.get('HTTP_REFERER'))
    return redirect(request.META.get('HTTP_REFERER'))
        

class CourseEnrollment(APIView):

    def get(self,request,course_id):
        print("here we go")
        return Response({"message":"Invalid Request made","status":"error"})

    def post(self,request,course_id):
        if request.user.is_authenticated:
            if request.method == "POST":
                try:
                    already_enrolled = EnrolledStudents.objects.filter(student_id = request.user.id,course_id = course_id)
                    if already_enrolled.exists():
                        return Response({"message":"Already Enrolled ✅","status":"success"})
                    enroll_student = EnrolledStudents.objects.create(
                        student_id_id = request.user.id,
                        course_id_id = course_id,
                        enrolled_date = request.POST.get('enrolled_date'),
                        enrolled_time = request.POST.get('enrolled_time'),
                    )
                    course = Courses.objects.filter(id = course_id).first()
                    subject = "Thankyou For Enrollment"
                    body = EnrollmentTemplate(name=f"{request.user.first_name} {request.user.last_name}",course_name=course.course_name)
                    recipients = [request.user.email]
                    send_email(subject, body, recipients,sender_name="Enrollment Request Received - Webxter")
                    return Response({"message":"Enrolled ✅","status":"success"})
                except Exception as e:
                    print(e)
                    return Response({"message":"Server Error. Please try again in sometime.","status":"error"})
            return Response({"message":"Server Error. Please try again in sometime.","status":"error"})
        return Response({"message":"You must be logged in to enroll in a course!","status":"error"})


def getEnrolledtudents(request):
    if request.user.is_superuser:
        students = EnrolledStudents.objects.all().order_by('-id')
        return render(request,'all-enrolled-students.html',{"students":students})


class ModifyEnrolledStudetns(APIView):

    def post(self,request):
        try:
            data = request.data

            student_id = data['student_id']
            enrolled_students = EnrolledStudents.objects.filter(id = student_id)

            enrolled_students.update(
                is_read = True
            )
            return Response({"data":[],"message":"status updated","status":"success"})
        except Exception as e:
            return Response({"data":[],"message":f"Something went worng -{e}","status":"error"})
        

def createCertificate(request):
    students = CompanyUser.objects.all()
    if request.method == "POST":
        try:
            certificate = Certificate_IDS.objects.create(
                certificate_number = request.POST.get('certificate_number'),
                student_id_id = request.POST.get('student_id'),
            )
            certificate.save()
            messages.success(request,"certificate created")
            return redirect(request.META.get('HTTP_REFERER'))
        except Exception as e:
            print(e)
            messages.error(request,"duplicate values")
            return redirect(request.META.get('HTTP_REFERER'))
    return render(request,"add-certificate-id.html",{'students':students})


class CertificateValidation(APIView):

    def get(self,request):
        return render(request,"certificate_validation.html")

    def post(self,request):
        data = request.data
        certificate_number = data.get('certificate_number')
        certificate = Certificate_IDS.objects.filter(certificate_number = certificate_number).filter(email = data.get('email')).first()
        if certificate is not None:
            email_body = certificate_validation_template(certificate=certificate,status="Valid")
            send_email(subject="Course Certificate Validation Status",body=email_body,recipients=[certificate.email])
            return Response({"message":"Verification Details has been sent to your registered email address","status":"success"})
        else:
            email_body = certificate_invalidation_template(email=data.get('email'),certificate_number=data.get('certificate_number'))
            send_email(subject="Invalid Certificate or No Association Found",body=email_body,recipients=[data.get('email')])
            return Response({"message":"Verification Details has been sent to your email address","status":"success"})
    

def forgotPassword(request):
    if request.method == "POST":
        try:
            email = request.POST.get('email')
            security_question_1 = request.POST.get('security_question_1')
            security_question_1_answer = request.POST.get('security_question_1_answer')
            security_question_2 = request.POST.get('security_question_2')
            security_question_2_answer = request.POST.get('security_question_2_answer')
            user = CompanyUser.objects.filter(email = email).filter(security_question_1 = security_question_1).filter(security_question_1_answer = security_question_1_answer).filter(security_question_2 = security_question_2).filter(security_question_2_answer =security_question_2_answer).first()
            if user is not None:
                return render(request,"new-password.html",{"users":user})
            else:
                messages.error(request,"invalid email or security details!")
                return redirect(request.META.get('HTTP_REFERER'))
        except Exception as e:
            print(e)
            messages.error(request,"something went wrong!")
            return redirect(request.META.get('HTTP_REFERER'))
    return render(request,"forgot-password.html")    
    

def updatePassword(request,user_id):
    if request.method == "POST":
        new_password = request.POST.get('new_password')
        confirm_password = request.POST.get('confirm_password')
        if new_password == confirm_password:
            print(new_password)
            user = User.objects.filter(id = user_id).first()
            user.set_password(new_password)
            user.save()
            messages.success(request,"Password Updated")
            return redirect('/')
        messages.error(request,"password mismatch")
        return redirect(request.META.get('HTTP_REFERER'))
    return redirect(request.META.get('HTTP_REFERER'))
    
                
def addNotes(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            try:
                notes = Notes.objects.create(
                    user_id_id = request.user.id,
                    notes_title = request.POST.get('notes_title'),
                    notes = request.POST.get('notes'),
                    written_on = request.POST.get('written_on'),
                )
                messages.success(request,"note created")
                return redirect(f'/notes/{notes.id}/')
            except Exception as e:
                print(e)
                messages.error(request,f"error - {e}")
                return redirect(request.META.get('HTTP_REFERER'))
        return render(request,"add-notes.html")
    messages.warning(request,"Please Login <a href='/login/'>Login</a>")
    return redirect(request.META.get('HTTP_REFERER'))


def editNotes(request,notes_id):
    notes = Notes.objects.filter(id = notes_id).first()
    if request.user.is_authenticated:
        if request.method == "POST":
            form = NotesForm(request.POST,instance=notes)
            if form.is_valid():
                form.save()
                messages.success(request,"updated")
                return redirect(request.META.get('HTTP_REFERER'))
            messages.error(request,f"error - {form.errors}")
            return redirect(request.META.get('HTTP_REFERER'))
        return redirect(request.META.get('HTTP_REFERER'))
    return render(request,"edit-notes.html",{'notes':notes})


def getallNotes(request):
    if request.user.is_authenticated:
        notes = Notes.objects.filter(user_id = request.user.id)
        return render(request,"all-notes.html",{'notes':notes})
    messages.warning(request,"Please <a href='/login/'>Login</a>")
    return redirect(request.META.get('HTTP_REFERER'))


def getNote(request,notes_id):
    if request.user.is_authenticated:
        note = Notes.objects.filter(user_id = request.user.id).filter(id = notes_id)
        return render(request,"one-note.html",{'note':note.first()})
    messages.warning(request,"Please <a href='/login/'>Login</a>")
    return redirect(request.META.get('HTTP_REFERER'))


def deleteNotes(request,notes_id):
    if request.user.is_authenticated:
        if request.method == "POST":
            notes = Notes.objects.filter(id = notes_id)
            if request.user.id != notes.first().user_id.id:
                messages.error(request,f"invalid request!")
                return redirect(request.META.get('HTTP_REFERER'))
            try:
                notes.delete()
                messages.success(request,"deleted")
                return redirect("/notes/")
            except Exception as e:
                print(e)
                messages.error(request,f"error - {e}")
                return redirect(request.META.get("HTTP_REFERER"))
        return redirect(request.META.get("HTTP_REFERER"))
    messages.warning(request,"Please <a href='/login/'>Login</a>")
    return redirect(request.META.get("HTTP_REFERER"))
        

def addBlog(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            try:
                blog = Blogs.objects.create(
                    user_id_id = request.user.id,
                    blog_title = request.POST.get('blog_title'),
                    blog_content = request.POST.get('blog_content'),
                    written_on = request.POST.get('written_on'),
                    is_published = request.POST.get('is_published'),
                )
                messages.success(request,"Uploaded")
                return redirect(f'/blog/{blog.id}/')
            except Exception as e:
                print(e)
                messages.error(request,f"error - {e}")
                return redirect(request.META.get('HTTP_REFERER'))
        return render(request,"add-blog.html")
    return redirect(request.META.get('HTTP_REFERER'))


def editBlog(request,slug):
    if request.user.is_authenticated:
        blog = Blogs.objects.filter(slug = slug).first()
        if request.method == "POST":
            if blog.user_id.id != request.user.id:
                messages.warning(request,"Invalid request")
                return redirect(request.META.get('HTTP_REFERER'))
            form = BlogsForm(request.POST,instance=blog)
            if form.is_valid():
                form.save()
                messages.success(request,"updated")
                return redirect(request.META.get('HTTP_REFERER'))
            messages.error(request,f"error - {form.errors}")
            return redirect(request.META.get('HTTP_REFERER'))
        return render(request,"edit-blog.html",{'blog':blog})
    messages.warning(request,"Please <a href='/login'>Login</a>")
    return redirect(request.META.get('HTTP_REFERER'))


def deleteBlog(request,blog_id):
    if request.user.is_authenticated:
        blog = Blogs.objects.filter(id = blog_id)
        if request.method == "POST":
            if request.user.id != blog.first().user_id.id:
                messages.warning(request,"Invalid request")
                return redirect(request.META.get('HTTP_REFERER'))
            
            blog.delete()
            messages.success(request,"Deleted")
            return redirect(request.META.get('HTTP_REFERER'))
        return redirect(request.META.get('HTTP_REFERER'))
    messages.warning(request,"Please <a href='/login/'>Login</a>")
    return redirect(request.META.get('HTTP_REFERER'))
        

def getBlogs(request):
    if request.user.is_authenticated:
        blogs = Blogs.objects.filter(user_id = request.user.id)
        return render(request,"all-blogs.html",{"blogs":blogs})
    messages.warning(request,"Please <a href='/login/'>Login</a>")
    return redirect(request.META.get('HTTP_REFERER'))
        
                    
def demoRegisterView(request):
    return render(request,"enrollment/demo.html")


class DemoRegisterationAPI(APIView):
    
    def post(self,request):
        data = request.data
        serializer_class = DemoRegisterationSerializer(data=data)
        if serializer_class.is_valid():
            serializer_class.save()
            # body = AdminDemoClassRegestrationTemplate(name=data.get('name'),
            #                                           email=data.get('email'),
            #                                           contact_number=data.get('contact_number'),
            #                                           alternate_number=data.get('alternate_number'),
            #                                           course_name=Courses.objects.filter(id = data.get('course')).first().course_name,
            #                                           time_slot=f"{TimeSlots.objects.filter(id = data.get('time_slot')).first().start_slot}-{TimeSlots.objects.filter(id = data.get('time_slot')).first().end_slot}",
            #                                           date_slot=data.get('date_slot'),
            #                                           date_of_birth = data.get('date_of_birth'),
            #                                           gender = data.get('gender')
            #                                           )
            body = admin_template(name=data.get('name'),email=data.get('email'),form_type="Demo Registeration")
            studentbody = DemoClassRegestrationTemplate(name=data.get('name'),
                                                        course_name=Courses.objects.filter(id = data.get('course')).first().course_name,
                                                        time_slot=f"{TimeSlots.objects.filter(id = data.get('time_slot')).first().start_slot}-{TimeSlots.objects.filter(id = data.get('time_slot')).first().end_slot}" ,
                                                        date_slot=data.get('date_slot'))
            send_email(subject="Course Demo Registration Confirmation",body=studentbody,recipients=[data.get('email')],sender_name="Webxter Demo Confirmation")
            send_email(subject="New Demo Class Booking",body=body,recipients=["kabir.behal7830@gmail.com"],sender_name="Webxter Demo Request")
            return Response({"data":[],"message":"Demo Booked","status":"success"})
        return Response({"data":[],"message":serializer_class.errors,"status":"error"})
        

class GetDemoTimeSlots(APIView):
    
    def get(self,request):
        
        time_slots = TimeSlots.objects.filter(is_available=True).filter(is_for_demo=True).values('id','start_slot','end_slot')
        serializer_class = DemoTimeSlotsSerializer(time_slots,many=True)
        return Response({"data":serializer_class.data,"message":"","status":"success"})


class AdminTimeSlotsAPI(APIView):
    
    def get(self,request):
        pass
    
    def post(self,request):
        
        data = request.data
        
        serializer_class = AdminTimeSlotSerializer(data=data)
        
        if serializer_class.is_valid():
            serializer_class.save()
            return Response({"data":[],'message':"Slot Added","status":"success"})
        return Response({"data":[],"message":serializer_class.errors,"status":"error"})
        

class AdminBatchAPI(APIView):
    
    def post(self,request):
        
        data = request.data
        serializer_class = AdminBatchSerializer(data=data)
        if serializer_class.is_valid():
            serializer_class.save()
            return Response({"data":[],"message":"Batch Added","status":"success"})
        return Response({"data":[],"message":serializer_class.errors,"status":"error"})


class BatchAPI(APIView):
    
    def get(self,request):
        
        batches = Batches.objects.all().values('id','name')
        batch_serializer = BatchSerializer(batches,many=True)
        return Response({"data":batch_serializer.data,"message":"","status":"success"})
                


def RegistrationFormTemplate(request):
    return render(request,"enrollment/registration.html")


class RegisterationFormAPI(APIView):
    
    def post(self,request):
        
        data = request.data
        serializer_class = RegistrationFormSerializer(data=data)
        if serializer_class.is_valid():
            serializer_class.save()
            return Response({"data":[],"message":"Registered","status":"success"})
        return Response({"data":[],"message":serializer_class.errors,"status":"error"})
        

def CoursedetailsTemplate(request):
    return render(request,"courses/course-details.html")
    
            

        
