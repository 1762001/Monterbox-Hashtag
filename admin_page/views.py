from django.db.models import *
from django.shortcuts import *
from admin_page.models import *
from admin_page.forms import *
from admin_page.functions import *
import random
import sys
import datetime
from django.contrib import messages
from django.conf import settings
from django.core.mail import send_mail


def index(request):
    if request.session.has_key('a_username'):
        u = Users.objects.all().count()
        p = Product.objects.all().count()
        o = Order.objects.all().count()
        f = Feedback.objects.all().count()
        g = Game.objects.all().count()
        t = Tournament.objects.all().count()
        player = Player.objects.all().count()
        team = Team.objects.all().count()
        data = reversed(Order.objects.filter(o_status=0)[:10])
        data2 = Tournament.objects.order_by('-t_id')[:5]
        return render(request, "index.html", {'u': u, 'p': p,
                                              'o': o, 'f': f,
                                              'g': g, 't': t,
                                              'player': player,
                                              'team': team,
                                              'orders':data,
                                              'tournaments':data2})
    else:
        return render(request, 'sign-in.html')

def send_email(request):
    otp1 = random.randint(10000, 99999)
    e = request.POST['email']
    request.session['temail'] = e
    obj = Users.objects.filter(email=e , is_admin=1).count()
    if obj == 1:
        val = Users.objects.filter(email=e, is_admin=1).update(otp=otp1, otp_used=0)
        subject = 'OTP Verification from eSports Devices and Battles'
        message = str(otp1)
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [e, ]
        send_mail(subject, message, email_from, recipient_list)
        return render(request, 'reset_password.html')
    else:
        messages.error(request, "Email does not match")
        return render(request, "forgot_password.html")


def forgot_password(request):
    return render(request, "forgot_password.html")


def set_password(request):
    totp = request.POST['otp']
    tpassword = request.POST['password']
    cpassword = request.POST['cpassword']

    if tpassword == cpassword:
        e = request.session['temail']
        val = Users.objects.filter(email=e, is_admin=1,otp=totp).count()

        if val == 1:
            val = Users.objects.filter(email=e, is_admin=1).update(otp_used=1,password=tpassword)
            return render(request, "sign-in.html")
        else:
            messages.error(request, "OTP does not match")
            return render(request, "reset_password.html")
    else:
        return render(request,"reset_password.html")


def login(request):

    if request.method == "POST":
        name = request.POST['u_name']
        pwd = request.POST['pwd']
        val = Users.objects.filter(email=name, password=pwd, is_admin=1).count()
        if val == 1:
            u = Users.objects.get(email=name,password=pwd, is_admin=1)
            request.session['a_uid'] = u.user_id
            request.session['a_uname'] = u.user_name
            request.session['a_username'] = name
            return redirect('/index')
        else:
            m = ":( Username or password does not match"
            messages.error(request, m)
            return render(request, "sign-in.html")
    else:
        return render(request, "sign-in.html")
    

def logout(request):
    try:
        del request.session['a_username']
        del request.session['temail']
        del request.session['a_uid']
    except:
        pass

    return render(request,"sign-in.html")


def select_user(request):
    if request.session.has_key('a_username'):
        data = Users.objects.all()
        return render(request, 'user_table.html', {"u": data})
    else:
        return render(request,"sign-in.html")


def select_category(request):
    if request.session.has_key('a_username'):
        data = Category.objects.all()
        return render(request, 'category_table.html', {"c": data})
    else:
        return render(request, "sign-in.html")


def select_product(request):
    if request.session.has_key('a_username'):
        data = Product.objects.all()
        return render(request, 'product_table.html', {"p": data})
    else:
        return render(request,"sign-in.html")


def select_order(request):
    if request.session.has_key('a_username'):
        data = reversed(Order.objects.all())
        return render(request, 'order_table.html', {"o": data})
    else:
        return render(request,"sign-in.html")


def select_payment(request):
    if request.session.has_key('a_username'):
        data = Payment.objects.all()
        return render(request, 'payment_table.html', {"p": data})
    else:
        return render(request,"sign-in.html")


def select_feedback(request):
    if request.session.has_key('a_username'):
        data = Feedback.objects.all()
        return render(request, 'feedback_table.html', {"f": data})
    else:
        return render(request,"sign-in.html")


def select_game(request):
    if request.session.has_key('a_username'):
        data = Game.objects.all()
        return render(request, 'game_table.html', {"g": data})
    else:
        return render(request,"sign-in.html")


def select_tournament(request):
    if request.session.has_key('a_username'):
        data = Tournament.objects.all()
        return render(request, 'tournament_table.html', {"t": data})
    else:
        return render(request,"sign-in.html")


def select_team(request):
    if request.session.has_key('a_username'):
        data = Team.objects.all()
        return render(request, 'team_table.html', {"t": data})
    else:
        return render(request,"sign-in.html")


def select_player(request):
    if request.session.has_key('a_username'):
        data = Player.objects.all()
        return render(request, 'player_table.html', {"p": data})
    else:
        return render(request,"sign-in.html")


def select_contactus(request):
    if request.session.has_key('a_username'):
        data = Contactus.objects.all()
        return render(request, 'contactus_table.html', {'c':data})

def delete_category(request,id):
    c = Category.objects.filter(c_id=id)
    c.delete()

    return redirect("/select-category")


def delete_product(request,id):
    p = Product.objects.filter(p_id=id)
    p.delete()

    return redirect("/select-product")


def delete_game(request,id):
    g = Game.objects.filter(game_id=id)
    g.delete()

    return redirect("/select-game")


def delete_tournament(request,id):
    t = Tournament.objects.filter(t_id=id)
    t.delete()

    return redirect("/select-tournament")


def insert_category(request):
    if request.method == "POST":
        form = CategoryForm(request.POST, request.FILES)
        print("------", form.errors)
        if form.is_valid():
            handle_uploaded_file(request.FILES['c_image'])
            try:
                form.save()
                messages.success(request, 'Inserted successfully!')
                return redirect('/select-category')
            except:
                pass
    else:
        form = CategoryForm()
    return render(request,'insert_category.html',{'form':form})


def insert_product(request):
    a = Category.objects.all()
    if request.method == "POST":
        form = ProductForm(request.POST, request.FILES)
        print("------", form.errors)
        if form.is_valid():
            try:
                handle_uploaded_file(request.FILES['p_image'])
                form.save()
                messages.success(request, 'Inserted successfully!')
                return redirect('/select-product')
            except:
                pass
    else:
        form = ProductForm()
    return render(request, 'insert_product.html', {'form': form,'cat':a})


def insert_game(request):
    if request.method == "POST":
        form = GameForm(request.POST, request.FILES)
        print("------", form.errors)
        if form.is_valid():
            try:
                handle_uploaded_file(request.FILES['wallpaper'])
                form.save()
                messages.success(request, 'Inserted successfully!')
                return redirect('/select-game')
            except:
                pass
    else:
        form = GameForm()

    return render(request, 'insert_game.html', {'form': form})


def insert_tournament(request):
    g = Game.objects.all()
    if request.method == "POST":
        form = TournamentForm(request.POST)
        print('----------------', form.errors)
        if form.is_valid():
            form.save()
            messages.success(request, 'Inserted successfully!')
            return redirect('/select-tournament')
            pass
    else:
        form = TournamentForm()
    date = datetime.date.today()
    return render(request, "insert_tournament.html", {"game": g, 'form':form,'date':str(date)})


def update_product(request, id):
    a = Category.objects.all()
    p = Product.objects.get(p_id=id)
    return render(request, 'update_product.html', {'product': p, 'cat': a})


def edit_product(request, id):
    p = Product.objects.get(p_id=id)
    form = ProductForm(request.POST, request.FILES, instance=p)
    print("----",form.errors)
    if form.is_valid():
        try:
            handle_uploaded_file(request.FILES['p_image'])
            print('---------',form.errors)
            form.save()
            return redirect("/select-product")
        except:
            form.p_image = p.p_image
            form.save()
            return redirect("/select-product")
    return render(request, "update_product.html", {'product':p})


def update_category(request, id):
    a = Category.objects.get(c_id=id)
    return render(request, 'update_category.html', {'cat': a})


def edit_category(request, id):
    c = Category.objects.get(c_id=id)
    form = CategoryForm(request.POST, request.FILES, instance=c)
    print("----",form.errors)
    if form.is_valid():
        try:
            handle_uploaded_file(request.FILES['c_image'])
            form.save()
            return redirect("/select-category")
        except:
            form.c_image = c.c_image
            form.save()
            return redirect("/select-category")
    return render(request, "update_category.html", {'cat':c})


def update_game(request, id):
    g = Game.objects.get(game_id=id)
    return render(request, 'update_game.html', {'game': g})


def edit_game(request, id):
    g = Game.objects.get(game_id=id)
    form = GameForm(request.POST, request.FILES, instance=g)
    print("----",form.errors)
    if form.is_valid():
        try:
            handle_uploaded_file(request.FILES['wallpaper'])
            form.save()
            return redirect("/select-game")
        except:
            form.wallpaper = g.wallpaper
            form.save()
            return redirect("/select-game")
    return render(request, "update_game.html", {'game':g})


def update_tournament(request,id):
    t = Tournament.objects.get(t_id=id)
    g = Game.objects.all()
    return render(request, "update_tournament.html",{"to": t,'game':g,'s_date':str(t.start_date),'f_date':str(t.finish_date)})


def edit_tournament(request,id):
    t = Tournament.objects.get(t_id=id)
    g = Game.objects.all()
    form = TournamentForm(request.POST, instance=t)
    print("----",form.errors)
    if form.is_valid():
        form.save()
        return redirect("/select-tournament")
    return render(request, "update_tournament.html", {'to':t,'game':g,'s_date':str(t.start_date),'f_date':str(t.finish_date)})


def order_detail(request,id):
    o_obj = OrderDetails.objects.filter(order_id=id)
    return render(request,'order_details_admin.html', {'od_obj': o_obj})


def edit_profile(request):
    id = request.session['a_uid']
    u = Users.objects.get(user_id=id)
    return render(request, 'edit_profile.html', {'u_obj': u, 'dob': str(u.user_dob)})


def update_profile(request):
    id = request.session['a_uid']
    u = Users.objects.get(user_id=id)
    form = UsersForm(request.POST, instance=u)
    print("----", form.errors)
    request.session['a_uname'] = request.POST['user_name']
    if form.is_valid():
        form.save()
        return redirect("/select-user")
    return render(request, "edit_profile.html", {'u_obj': u, 'dob': str(u.user_dob)})


def test(request):
    data = Order.objects.all().select_related("user_id")
    print("-------", data.count())
    return render(request, "test_orderReport.html", {"o": data})


def change_password(request):
    otp1 = random.randint(10000, 99999)
    e = request.session['a_username']
    request.session['temail'] = e
    obj = Users.objects.filter(email=e, is_admin=1).count()
    if obj == 1:
        Users.objects.filter(email=e, is_admin=1).update(otp=otp1, otp_used=0)
        subject = 'Request for Changing Password! Your OTP is'
        message = str(otp1)
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [e, ]
        send_mail(subject, message, email_from, recipient_list)
        return render(request, 'reset_password.html')


def accept(request, id):
    o = Order.objects.get(o_id=id)
    uid = o.user_id.user_id
    desc = "Your Order is accepted"
    try:
        obj = Notification(description=desc, o_id_id=int(id), user_id_id=int(uid))
    except:
        print("Uncaught Error : ", sys.exc_info()[0])
        pass

    subject = 'Order Notification'
    message = "Your Order is accepted...Your Order will be Soon Placed at..\n" + o.o_address
    email_from = settings.EMAIL_HOST_USER

    u = Users.objects.get(user_id=o.user_id_id)
    e = u.email
    recipient_list = [e, ]
    try:
        send_mail(subject, message, email_from, recipient_list)
        obj.save()
        o.o_status = 1
        o.save()
        return redirect("/select-order")
    except:
        send_mail(subject, message, email_from, recipient_list)
        return redirect("/select-order")

def reject(request, id):
    o = Order.objects.get(o_id=id)
    uid = o.user_id.user_id
    desc = "Your Order is Rejected"
    try:
        obj = Notification(description=desc, o_id_id=int(id), user_id_id=int(uid))
    except:
        print("Uncaught Error : ", sys.exc_info()[0])
        pass

    subject = 'Order Notification'
    message = "Your Order is Rejected"
    email_from = settings.EMAIL_HOST_USER

    u = Users.objects.get(user_id=o.user_id_id)
    e = u.email
    recipient_list = [e, ]
    try:
        send_mail(subject, message, email_from, recipient_list)
        obj.save()
        o.o_status = 2
        o.save()
        return redirect("/select-order")
    except:
        return redirect("/select-order")

    


def filter_by_date(request):
    if request.method == "POST":
        s_date = request.POST['s_date']
        e_date = request.POST['e_date']
        data = Order.objects.filter(o_date__range=[s_date, e_date]).select_related('user_id')
        request.session['s_date'] = s_date
        request.session['e_date'] = e_date
        return render(request, "test_orderReport.html", {"o": data})
    else:
        try:
            del request.session['s_date']
            del request.session['e_date']
        except:
            pass
        data = Order.objects.all().select_related('user_id')
        return render(request, "test_orderReport.html", {"o": data})


def apply_filter_status(request, id):
    if request.session.has_key('s_date'):
        s_date = request.session['s_date']
        e_date = request.session['e_date']
        print(s_date)
        if id != 3:
            data = Order.objects.filter(o_status=id,o_date__range=[s_date,e_date]).select_related("user_id")
        else:
            data = Order.objects.filter(o_date__range=[s_date,e_date]).select_related("user_id")
    elif id == 3:
        data = Order.objects.all().select_related("user_id")
    else:
        data = Order.objects.filter(o_status=id).select_related("user_id")
    return render(request, "test_orderReport.html", {"o": data, "id": id})


def order_report(request):
    data = Order.objects.all().select_related("user_id")
    print("-------",data.count())
    return render(request, "orderReport.html", {"o": data})


def player_report(request):
    obj = Player.objects.values('user_id').annotate(c=Count('user_id')).values('user_id', 'user_id__user_name', 'c')
    return render(request, "orderReport4.html", {"o": obj})


def tournament_report(request):
    data = Tournament.objects.all()
    return render(request, "orderReport3.html", {'t':data})


def filter(request,id):
    if id != 3:
        data = Order.objects.filter(o_status=id).select_related("user_id")
    else:
        data = Order.objects.filter().select_related("user_id")
    return render(request, "orderReport.html", {"o": data, "id": id})


def count_total(request):
    obj = Order.objects.filter(o_status=1).values('user_id').annotate(c=Sum('o_price')).values('user_id','user_id__user_name','c')
    print("------------------------", obj.count())
    return render(request, "orderReport2.html", {"o": obj})


def send_notification(request,id):
    if request.method == "POST":
        desc = request.POST['desc']
        o = Notification(description=desc,t_id_id=id)
        try:
            o.save()
        except:
            pass
        return redirect('/select-tournament/')
    else:
        t = Tournament.objects.get(t_id=id)
        return render(request,'send_notification.html', {'tournament': t})


def upload_score(request,id):
    tournament = Tournament.objects.get(t_id=id)
    if tournament.team_limit > 1:
        team = Team.objects.filter(t_id=id)
        player = Player.objects.filter(t_id=id)
        return render(request,'upload_team_score.html',{'t':team,'p':player})
    else:
        player = Player.objects.filter(t_id=id)
        return render(request,'upload_player_score.html',{'p':player})


def edit_score_team(request, id):
    if request.method == "POST":
        player = Player.objects.filter(team_id=id)
        total = 0;
        for data in player:
            o = Player.objects.get(player_id=data.player_id)
            o.player_score = request.POST[str(data.player_id)]
            total += int(o.player_score)
            o.save()
        team = Team.objects.get(team_id=id)
        team.team_score = total + int(request.POST['place_pts'])
        team.place_pts = request.POST['place_pts']
        team.save()
        for i in player:
            my_id = i.t_id.t_id
        return redirect('/upload-score/%s' % my_id)
    else:
        player = Player.objects.filter(team_id=id)
        for i in player:
            my_id = i.t_id.t_id
        return redirect('/upload-score/%s' % my_id)


def edit_score_player(request,id):
    if request.method == "POST":
        player = Player.objects.get(player_id=id)
        total = 0
        player.player_score = request.POST['k_score']
        player.place_pts = request.POST['p_score']
        try:
            player.save()
            return redirect('/upload-score/%s' % player.t_id.t_id)
        except:
            pass
    else:
        player = Player.objects.get(player_id=id)
        return redirect('/upload-score/%s' % player.t_id.t_id)


def paid(request,id):
    data = Order.objects.get(o_id=id)
    data.p_status = 1
    data.save()
    return redirect('/select-order/')