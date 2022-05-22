from random import *
from django.shortcuts import *
from admin_page.models import *
from django.contrib import messages
import random
from django.conf import settings
from django.core.mail import send_mail
from admin_page.forms import *
import datetime

# Create your views here.


def home(request):
    t_open = Tournament.objects.filter(reg_open=1).order_by('?')
    t_close = Tournament.objects.filter(reg_open=0).order_by('?')
    p = Product.objects.all().order_by('?')
    g_count = Game.objects.all().count()
    t_count = Tournament.objects.all().count()
    p_count = Player.objects.all().count()
    u_count = Users.objects.all().count()
    return render(request,"home.html",{'t_open':t_open,'t_close':t_close,'p_obj':p,'g_count':g_count, 't_count':t_count,'p_count':p_count,'u_count':u_count})


def insert_user(request):
    if request.method == "POST":
        form = UsersForm(request.POST)
        print("------", form.errors)
        if form.is_valid():
            try:
                form.save()
                f = Users.objects.latest('user_id')
                f.password = request.POST['password']
                f.save()
                return redirect('/client_page/client_login')
            except:
                pass
    else:
        form = UsersForm()
    return render(request, 'client_login.html', {'form': form})


def login(request):
    if request.method == "POST":
        name = request.POST['u_name']
        pwd = request.POST['pwd']
        val = Users.objects.filter(email=name, password=pwd, is_admin=0).count()
        u = Users.objects.filter(email=name)
        print('name')
        for data in u:
            id = data.user_id
            u_name = data.user_name
            print("-----",data.user_name)
        print(val)
        if val == 1:
            request.session['username'] = name
            request.session['user_name'] = u_name
            request.session['uid'] = id
            return redirect('/client_page/home')
        else:
            messages.error(request, "Username or Password does not match")
            return render(request, "client_login.html")

    else:
        return render(request, "client_login.html")


def forgot(request):
    return render(request, 'forgot_passc.html')


def logout(request):
    try:
        del request.session['username']
        del request.session['user_name']
        del request.session['uid']
    except:
        pass

    return render(request,"client_login.html")

def send_email(request):
    otp1 = random.randint(10000, 99999)
    e = request.POST['email']
    request.session['temail'] = e
    obj = Users.objects.filter(email=e , is_admin=0).count()
    if obj == 1:
        val = Users.objects.filter(email=e, is_admin=0).update(otp=otp1, otp_used=0)
        subject = 'OTP Verification from eSports Devices and Battles'
        message = str(otp1)
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [e, ]
        send_mail(subject, message, email_from, recipient_list)
        return render(request, 'reset_passc.html')
    else:
        messages.error(request, "Email does match with our record")
        return  render(request, "forgot_passc.html")


def set_password(request):
    totp = request.POST['otp']
    tpassword = request.POST['password']
    cpassword = request.POST['cpassword']

    if tpassword == cpassword:
        e = request.session['temail']
        val = Users.objects.filter(email=e, is_admin=0,otp=totp).count()

        if val == 1:
            val = Users.objects.filter(email=e, is_admin=0).update(otp_used=1,password=tpassword)
            return render(request, "client_login.html")
        else:
            messages.error(request,"OTP does not match")
            return render(request, 'reset_passc.html')

    return render(request, "reset_passc.html")


def display_shop(request):
    data = Product.objects.all()
    return render(request, 'shop.html', {"p": data})


def view_by_cat(request,id):
    data = Product.objects.filter(c_id=id);
    return render(request, 'shop.html', {'p': data})


def product_detail(request, id):
    if request.session.has_key('uid'):
        p = Product.objects.get(p_id=id)
        u_obj = Users.objects.get(user_id=request.session['uid'])
        feed_obj = Feedback.objects.filter(p_id=id)
        f_count = Feedback.objects.filter(p_id=id).count()
        rp_obj = Product.objects.filter(c_id=p.c_id.c_id).exclude(p_id=p.p_id).order_by('?')

        return render(request, 'product_detail.html', {'product':p, 'user_name':u_obj.user_name, 'rp_obj': rp_obj, 'f_obj':feed_obj, 'fcount':f_count})
    else:
        p = Product.objects.get(p_id=id)
        feed_obj = Feedback.objects.filter(p_id=id)
        f_count = Feedback.objects.filter(p_id=id).count()
        rp_obj = Product.objects.filter(c_id=p.c_id.c_id).exclude(p_id=p.p_id).order_by('?')

        return render(request, 'product_detail.html',
                      {'product': p, 'f_obj': feed_obj, 'fcount': f_count, 'rp_obj': rp_obj})


def view_cart(request):
    if request.session.has_key('uid'):
        uid =request.session['uid']
        print('uid')
        data = Cart.objects.filter(user_id=uid)
        total = 0
        for c in data:
            total += c.price
        c = Cart.objects.filter(user_id=uid)
        return render(request, 'cart.html', {"cart_object": c,"total":total})
    else:
        return redirect('/client_page/client_login')


def delete_cart(request,id):
    ca = Cart.objects.get(cart_id=id)
    ca.delete()
    return redirect('/client_page/cart')


def insert_cart(request):
    if request.session.has_key('uid'):
        if request.method == "POST":
            pro_id = request.POST['p_id']
            qty = request.POST['qty']
            id = request.session['uid']
            d = datetime.date.today()
            p_object = Product.objects.filter(p_id=pro_id)
            for i in p_object:
                amount = i.p_price
            total = amount * int(qty)
            obj = Cart(product_id_id=int(pro_id),price=total,quantity=qty,added_date=d,user_id_id=id)
            obj.save()
            return redirect('/client_page/cart')
        else:
            return redirect('/client_page/cart')
    else:
        return redirect('/client_page/client_login')


def checkout2(request,total):
    uid = request.session['uid']
    c = Cart.objects.filter(user_id=uid)
    if not c:
        messages.error(request, "Your cart is empty!")
        return redirect('/client_page/cart')
    else:
        date = datetime.date.today()
        o_status = 0
        o = Order(o_date=date,o_price=total,o_status=o_status,p_status=0,user_id_id=uid,o_address='Not Uploaded Yet',o_contact='0')
        o.save()
        o_id = Order.objects.latest('o_id')
        for data in c:
            pid = data.product_id
            print(data.product_id.p_price)
            price = data.product_id.p_price
            qty = data.quantity
            p_total = int(qty) * int(price)
    
            o_detail = OrderDetails(o_date=date, o_qty=qty, total_price=p_total,product_id=pid, order_id=o_id)
            o_detail.save()
        c.delete()
        return redirect('/client_page/order')

def select_order(request):
    uid = request.session['uid']
    data = reversed(Order.objects.filter(user_id=uid))
    return render(request, 'order.html', {"order_object": data})


def view_order_detail(request, id):
    print(id)
    order_object = OrderDetails.objects.filter(order_id=id)
    return render(request, 'order_detail.html', {'o_obj': order_object})


def edit_profile(request):
    id = request.session['uid']
    user_object = Users.objects.get(user_id=id)
    return render(request, 'update_profile.html', {'u_obj': user_object, 'dob': str(user_object.user_dob)})


def update_profile(request):
    id = request.session['uid']
    u = Users.objects.get(user_id=id)
    form = UsersForm(request.POST, instance=u)
    print("----", form.errors)
    if form.is_valid():
        request.session['user_name'] = request.POST['user_name']
        form.save()
        return redirect("/client_page/home")
    return render(request, "update_profile.html", {'u_obj': u, 'dob': str(u.user_dob)})


def view_games(request):
    u = Game.objects.all()
    return render(request, 'browse_games.html', {'g_obj': u})


def view_tournaments(request, id):
    object_t = Tournament.objects.filter(game_id=id)
    object_g = Game.objects.get(game_id=id)
    return render(request, 'browse_tourneys.html', {'t_obj': object_t, 'g_obj':object_g})


def view_t_detail(request, id):
    t = Tournament.objects.get(t_id=id)
    object_p = Player.objects.filter(t_id=id).order_by('-player_score')
    object_p_name = Player.objects.filter(t_id=id)
    object_g = Game.objects.get(game_id=t.game_id.game_id)
    object_team = Team.objects.filter(t_id=id).order_by('-team_score')
    object_team_name = Team.objects.filter(t_id=id)
    if request.session.has_key('uid'):
        session_id = request.session['uid']
    else:
        session_id = None;
    player_obj = Player.objects.filter(user_id=session_id,t_id=id,is_main=1)
    player_id = ""
    for data in player_obj:
        player_id = data.user_id.user_id
    return render(request, 'torney_detail.html', {'td_obj': t, 'g_obj': object_g,
                                                    'u_id': player_id ,'p_obj':object_p,
                                                    'team_obj':object_team, 'team_obj_name':object_team_name,
                                                    'p_obj_name':object_p_name})


def view_m_tourney(request):
    t = Player.objects.filter(user_id=request.session['uid'],is_main=1)
    return render(request, "view_m_tourney.html",{"t_obj": t})


def register_tournament(request,id):
    if request.session.has_key('uid'):
        t = Tournament.objects.get(t_id=id)
        return render(request, 'register_tournament.html', {'td_obj': t})
    else:
        return redirect('/client_page/client_login')


def participate(request, id):
    if request.method == "POST":
        t = Tournament.objects.get(t_id=id)
        print('----------------',t.team_limit)
        p_1 = request.POST['cname']
        p_2 = request.POST['player_2']
        p_3 = request.POST['player_3']
        p_4 = request.POST['player_4']
        team = request.POST['team_name']
        tuple = (p_1,p_2,p_3,p_4)
        if t.team_limit == 1:
            p_1 = request.POST['cname']
            print('--------------',p_1)
            p_obj = Player(player_name=p_1,player_score=0,place_pts=0,t_id_id=id,user_id_id=request.session['uid'],is_main=1)
            try:
                p_obj.save()
                t.re_player += 1
                t.save()
                print('--------------',p_1)
                return redirect('/client_page/my_tournaments')
            except:
                pass
        if t.team_limit >= 2:
            team_obj = Team(team_name=team, team_score=0, no_of_player=t.team_limit, t_id_id=id)
            team_obj.save()
            te_id = Team.objects.latest('team_id')
            main = 1
            u = request.session['uid']
            for i in range(t.team_limit):
                p_obj = Player(player_name=tuple[i],place_pts=0,player_score=0,is_main=main,team_id_id=te_id.team_id, t_id_id=id, user_id_id=u)
                p_obj.save()
                u = None
                main = 0
                t.re_player += 1
                t.save()
            return redirect('/client_page/my_tournaments')

    else:
        return redirect('/client_page/view-tourney/%s' % id)


def insert_feedback(request, id):
    if request.session.has_key('uid'):
        if request.method == "POST":
            f_d = request.POST['f_desc']
            u_id = request.session['uid']
            date = datetime.date.today()
            p = Product.objects.get(p_id=id)
            pr_id = p.p_id
            f = Feedback(f_desc=f_d,user_id_id=u_id,f_date=date,p_id_id=pr_id)
            try:
                f.save()
                return redirect('/client_page/product-detail/%s' % id)
            except:
                pass
        else:
            return redirect('/client_page/product-detail/%s' % id)
    else:
        return redirect('/client_page/client_login')


def view_category(request):
    data = Category.objects.all()
    return render(request, 'shop_cat.html', {'c' : data})


def test(request):
    if request.session.has_key('uid'):
        user = Player.objects.filter(user_id=request.session['uid'])
        my_list = []
        for i in user:
            my_list.append(i.t_id.t_id)
        data2 = reversed(Notification.objects.filter(t_id__in=my_list))
        data = reversed(Notification.objects.filter(user_id=request.session['uid']))
        return render(request, "notification.html", {'obj_n':data, 'obj_n2':data2})
    else:
        return redirect('/client_page/client_login')


def subscribe(request):
    subject = 'Subscription Mail from eSports Devices and Battles '
    message = "Thank You For Subscribe...."
    email_from = settings.EMAIL_HOST_USER

    u = request.POST['EMAIL']
    recipient_list = [u, ]
    send_mail(subject, message, email_from, recipient_list)

    return redirect('/client_page/home')


def contact_us(request):
    if request.method == "POST":
        form = ContactusForm(request.POST)
        print("------", form.errors)
        if form.is_valid():
            try:
                form.save()
                return redirect('/client_page/home')
            except:
                pass
    else:
        form = ContactusForm()
    return render(request, 'contact_us.html', {'form': form})


def failure(request):
    return render(request, 'failure.html')


def success(request,id):
    data = Order.objects.get(o_id=id)
    data.p_status = 2
    data.save()
    return render(request, 'success.html')


def edit_order(request,id):
    o = Order.objects.get(o_id=id)
    o_obj = OrderDetails.objects.filter(order_id=id)
    return render(request, 'ship_order.html',{"o":o,"o_obj":o_obj})


def update_order(request,id):
    if request.method == "POST":
        o = Order.objects.get(o_id=id)
        o.o_address = request.POST['hnumber1'] + "\n" + request.POST['hnumber2'] + "\n" + request.POST['city'] + "\n" + request.POST['pcode']
        o.o_contact = request.POST['number']
        o.save()
        return redirect('/client_page/order')
    else:
        o = Order.objects.get(o_id=id)
        return redirect('/client_page/ship-order/%s' % o.o_id)

