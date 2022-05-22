
def handle_uploaded_file(f):
    print("----", f.name)
    with open('admin_page/static/assets/images/my_images/'+f.name, 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)