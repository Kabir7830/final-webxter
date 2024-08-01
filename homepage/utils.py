def is_admin(request):
    if request.user.is_superuser:
        return True
    return False


def is_logged_in(request):
    
    if request.user.is_authenticated:
        return True
    return False

def is_post(request):
    
    if request.method == "POST":
        return True
    return False

def is_method_post(request):
    
    if request.method == "POST":
        return True
    return False

