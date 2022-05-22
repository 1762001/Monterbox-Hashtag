from admin_page.forms import *


def categories_processor(request):
    categories = Category.objects.all()
    return {'categories': categories}