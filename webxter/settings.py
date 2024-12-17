from pathlib import Path
import os
from django.contrib import messages
BASE_DIR = Path(__file__).resolve().parent.parent




SECRET_KEY = 'django-insecure-gn)kin9=fdyr06(=%=z)_3(#3(x%v&w)n^c__$)i1^7t3!88o!'


# DEBUG = True
DEBUG = True

# ALLOWED_HOSTS = ["webxter.in","www.webxter.in","http://www.webxter.in","https://www.webxter.in"]
ALLOWED_HOSTS = ["*"]

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'webxterwebs@gmail.com'
EMAIL_HOST_PASSWORD = 'zqdwlphzxcyopjbn'
EMAIL_PORT = 587
EMAIL_USE_TLS = True

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'homepage',
    'corsheaders',
    'calorie_calculator',
    'markdownify',
    'apis',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'webxter.middleware.HttpsRedirectMiddleware'
]

ROOT_URLCONF = 'webxter.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'homepage.context_processors.Collection',
            ],
        },
    },
]

WSGI_APPLICATION = 'webxter.wsgi.application'

AUTH_USER_MODEL = "homepage.CompanyUser"

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'cloudmagika_webxter',
        'USER': 'root',
        'PASSWORD': '',
        'HOST' : 'localhost',
        'PORT' : '3306',
        'OPTIONS' : {
            'init_command':"SET sql_mode='STRICT_TRANS_TABLES'",
        }

    }
}




AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]



LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


STATIC_URL = '/static/'
MEDIA_URL = '/media/'

if DEBUG:
    STATICFILES_DIRS = [os.path.join(BASE_DIR, "static")]
else:
    STATIC_ROOT = os.path.join(BASE_DIR,'static')

MEDIA_ROOT =os.path.join(BASE_DIR,'media')


DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


MESSAGE_TAGS ={
    messages.ERROR : 'danger'
}

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'logfile.log',
        },
    },
    'loggers': {
        'otp': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}


REST_FRAMEWORK = {
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 10,  # Number of items per page
}

CORS_ALLOWED_ORIGINS = [
    "http://localhost:3000",  # React app
]
CORS_ALLOW_ALL_ORIGINS = True
