from django.urls import path
from .views import *
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    
    # informative pages
    path("",homepage,name="homepage"),
    path("admin/",adminHomepage,name="dashboard"),
    path("about-us/",aboutUs,name="about"),
    path("privacy-policy/",privacyPolicy,name="privacy-policy"),
    # courses
    path("courses/",getAllCourses,name="courses"),
    path("courses/<slug:slug>/",getCourseDetails,name="course-details"),
    path('coachings/',getCoachings,name="coachings"),
    path('course-deatils/',CoursedetailsTemplate,name="course-dtls"),
    
    # authentication
    path("signup/",SignUp,name="signup"),
    path("login/",loginHandler,name="login"),
    path("logout/",LogoutHandler,name="logout"),
    path("forgot-password/",forgotPassword,name="forgot-password"),
    path("update-password/<int:user_id>/",updatePassword,name="update-password"),
    
    # certificate
    path("create-certificate/",createCertificate,name="create-certificate"),
    path("validate-certificate/",CertificateValidation.as_view(),name="validate-certificate"),
    
    # enrollment
    path("enroll/<int:course_id>/",CourseEnrollment.as_view(),name="enroll"),
    path("enroll/demo/",demoRegisterView,name="book-demo"),
    path('enroll/registration/',RegistrationFormTemplate,name="course-registration"),
    
    # admin
    path("add-course/",addCourse,name="add-course"),
    path("add-banner/",addCarouselImage,name="add-banner"),
    path("add-company-info/",addCompanyInfo,name="add-company-info"),
    path("add-coaching/",addCoaching,name="add-coaching"),
    path("add-request-callback/",addRequestCallBack,name="request-callback"),
    path("edit-course/<int:course_id>/",editCourse,name="edit-course"),
    path("edit-banner/<int:carousel_id>/",editCarouselImage,name="edit-banner"),
    path("edit-coaching/<int:coaching_id>/",editCoaching,name="edit-coaching"),
    path("request/<int:req_id>/read/",makeRequestRead,name="read-request"),
    path("edit-company-info/",editCompanyInfo,name="edit-company-info"),
    path("all-courses/",allCourses,name="admin-courses"),
    path("all-banners/",allBanners,name="admin-banners"),
    path("all-requests/",allRequestCallBack,name="admin-requests"),
    path("all-coachings/",getAllCoaching,name="admin-coachings"),
    path("all-enrolled-students/",getEnrolledtudents,name="admin-enrolled-students"),
    path("delete-course/<int:course_id>/",deleteCourse,name="delete-course"),
    path("delete-banner/<int:carousel_id>/",deleteBanner,name="delete-banner"),
    path("request/<int:req_id>/delete/",deleteRequestCallBack,name="delete-request"),
    path('coaching/<slug:slug>/',getCoachingDetails,name="coaching-details"),
    path("delete/coaching/<int:coaching_id>/",deleteCoaching,name="delete-coaching"),
    path('add-note/',addNotes,name="add-note"),
    path('notes/',getallNotes,name="notes"),
    path('notes/<int:notes_id>/',getNote,name="note-details"),
    path('notes/<int:notes_id>/edit/',editNotes,name="edit-note"),
    path('notes/<int:notes_id>/delete/',deleteNotes,name="delete-note"),
    path('add-blog/',addBlog,name="add-blog"),
    path('blog/<slug:slug>/',editBlog,name="edit-blog"),
    path('blog/<int:blog_id>/delete/',deleteBlog,name="delete-blog"),
    path('blogs/',getBlogs,name="blogs"),
    path('zohoverify/verifyforzoho.html',openZoho),
    path("send-otp/",otpAPI.as_view(),name="send-otp"),
    path("verify-otp/",verifyOTP.as_view(),name="verify-otp"),
    path('add-company/',AddCompany,name="add-company"),
    path('edit-company/',EditCompany,name="edit-company"),
    path('add-category/',addCourseCategory,name="add_course_category"),
    path('edit-category/<int:category_id>/',editCourseCategory,name="edit_course_category"),
    
    # error pages
    path('404/',Error404,name='404'),
    path('500/',Error500,name='500'),



    # APIs

        # courses
    path('courses-api/',CoursesAPI.as_view(),name="courses-api"),
    path('course-form-api/',CourseForFormAPI.as_view(),name="courses-form-api"),
    
    path("admin/courses-api/",AdminCourses.as_view(),name="admin-courses-api"),
    
        # Time Slots
    path('create-new-time-slot/',AdminTimeSlotsAPI.as_view(),name="admin-create-new-time-slots"),
    path('all-demo-time-slots/',GetDemoTimeSlots.as_view(),name="get-demo-time-slots"),
    path('enrolled-student-mark-as-read-api/',ModifyEnrolledStudetns.as_view(),name="enrolled_student_mark_as_read_api"),
    path("add-request-callback-api/",RequestCallbackAPI.as_view(),name="request-callback-api"),
    
        # Demo Register
    path('enroll/demo-api/',DemoRegisterationAPI.as_view(),name="book-demo-api"),
    
        # Registration
    path('enroll/registration-api/',RegisterationFormAPI.as_view(),name="registration-api"), 
    
        # Batch
    path("batches/add-new-batch-api/",AdminBatchAPI.as_view(),name="create-new-batch"),
    path("batches/all-api/",BatchAPI.as_view(),name="batches-api"), 
    
    


]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)