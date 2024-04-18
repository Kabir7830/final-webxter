from django.conf import settings
from django.http import HttpResponsePermanentRedirect

class HttpsRedirectMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Check if the request is not secure (HTTP)
        # if not request.is_secure():
            # Build the new URL with HTTPS scheme
            # secure_url = request.build_absolute_uri().replace("http://", "https://")
            # return HttpResponsePermanentRedirect(secure_url)

        return self.get_response(request)
