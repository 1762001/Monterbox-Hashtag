from django.db import models
from datetime import *

class Users(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=40, null=False)
    email = models.EmailField(unique=True, null=False)
    user_dob = models.DateField()
    user_gender = models.CharField(max_length=10, null=False)
    password = models.TextField(null=False)
    contact = models.CharField(max_length=15, null=False)
    is_admin = models.IntegerField(default=0)
    otp = models.CharField(max_length=10)
    otp_used = models.IntegerField(default=0)
    class Meta:
        db_table = "users"


class Category(models.Model):
    c_id = models.AutoField(primary_key=True)
    c_name = models.CharField(max_length=20,null=False)
    c_image = models.CharField(max_length=400,null=False)

    class Meta:
        db_table = "category"


class Product(models.Model):
    p_id = models.AutoField(primary_key=True)
    p_name = models.TextField(null=False)
    p_price = models.IntegerField(null=False)
    p_desc = models.TextField(null=False)
    in_stock = models.CharField(max_length=50,null=False)
    p_image = models.CharField(max_length=400,null=False)
    c_id = models.ForeignKey(Category, on_delete=models.CASCADE, null=False, db_column='c_id')

    class Meta:
        db_table = "product"


class Cart(models.Model):
    cart_id = models.AutoField(primary_key=True)
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE, null=False, db_column='product_id')
    quantity = models.IntegerField()
    price = models.IntegerField()
    user_id = models.ForeignKey(Users, on_delete=models.CASCADE, null=False, db_column='user_id')
    added_date = models.DateField()

    class Meta:
        db_table = "cart"


class Order(models.Model):
    o_id = models.AutoField(primary_key=True)
    o_date = models.DateField(null=False)
    o_address = models.TextField()
    o_contact = models.CharField(max_length=15, null=False,default=-0)
    o_price = models.IntegerField(null=False)
    p_status = models.IntegerField(null=False)
    o_status = models.IntegerField(null=False)
    user_id = models.ForeignKey(Users, on_delete=models.CASCADE, null=False, db_column='user_id')

    class Meta:
        db_table = "order"


class OrderDetails(models.Model):
    o_details_id = models.AutoField(primary_key=True)
    o_date = models.DateField()
    o_qty = models.IntegerField()
    total_price = models.IntegerField()
    product_id = models.ForeignKey(Product, on_delete=models.CASCADE, null=False, db_column='product_id')
    order_id = models.ForeignKey(Order, on_delete=models.CASCADE, null=False, db_column='order_id')

    class Meta:
        db_table = "order_details"


class Payment(models.Model):
    pay_id = models.AutoField(primary_key=True)
    pay_status = models.CharField(max_length=10, null=False)
    amount = models.CharField(max_length=10, null=False)
    date_paid = models.DateField(null=False)
    o_id = models.ForeignKey(Order, on_delete=models.CASCADE, null=False, db_column='o_id')

    class Meta:
        db_table = "payment"


class Feedback(models.Model):
    f_id = models.AutoField(primary_key=True)
    f_desc = models.CharField(max_length=400, null=False)
    f_date = models.DateField(null=False)
    user_id = models.ForeignKey(Users, on_delete=models.CASCADE, null=False, db_column='user_id')
    p_id = models.ForeignKey(Product, on_delete=models.CASCADE, null=False, db_column='p_id')

    class Meta:
        db_table = "feedback"


class Game(models.Model):
    game_id = models.AutoField(primary_key=True)
    game_name = models.CharField(max_length=300, null=False)
    platform = models.CharField(max_length=30, null=False)
    wallpaper = models.CharField(max_length=300, null=False)

    class Meta:
        db_table = "Game"


class Tournament(models.Model):
    t_id = models.AutoField(primary_key=True)
    t_name = models.TextField(null=False)
    t_desc = models.TextField(null=False)
    player_limit = models.IntegerField(null=False)
    re_player = models.IntegerField(null=False,default=0)
    team_limit = models.IntegerField(null=False)
    activate_result = models.IntegerField(null=False)
    start_date = models.DateField(default=datetime.today().strftime('%Y-%m-%d'))
    finish_date = models.DateField(null=False)
    reg_open = models.IntegerField(null=False)

    game_id = models.ForeignKey(Game, on_delete=models.CASCADE, null=False, db_column='game_id')

    class Meta:
        db_table = "tournament"


class Team(models.Model):
    team_id = models.AutoField(primary_key=True)
    team_name = models.CharField(max_length=30, null=False)
    team_score = models.IntegerField(null=False,default=0)
    place_pts = models.IntegerField(null=False,default=0)
    no_of_player = models.IntegerField(null=False)
    t_id = models.ForeignKey(Tournament, on_delete=models.CASCADE, null=False, db_column='t_id')

    class Meta:
        db_table = "team"


class Player(models.Model):
    player_id = models.AutoField(primary_key=True)
    player_name = models.CharField(max_length=30, null=False)
    player_score = models.CharField(max_length=40, null=False)
    place_pts = models.IntegerField(null=False)
    is_main = models.IntegerField()
    team_id = models.ForeignKey(Team, on_delete=models.CASCADE, null=False , db_column='team_id')
    t_id = models.ForeignKey(Tournament, on_delete=models.CASCADE, null=False,  db_column='t_id')
    user_id = models.ForeignKey(Users, on_delete=models.CASCADE,  db_column='user_id')

    class Meta:
        db_table = "player"


class Notification(models.Model):
    n_id = models.AutoField(primary_key=True)
    description = models.TextField()
    created_date = models.DateTimeField(default=datetime.now().replace(second=0, microsecond=0))
    o_id = models.ForeignKey(Order, on_delete=models.CASCADE, null=False, db_column='o_id')
    user_id = models.ForeignKey(Users, on_delete=models.CASCADE, db_column='user_id')
    t_id = models.ForeignKey(Tournament, on_delete=models.CASCADE, db_column='t_id',null=True)

    class Meta:
        db_table = "notification"


class Contactus(models.Model):
    contact_id = models.AutoField(primary_key=True)
    contact_name = models.CharField(max_length=30, null=False)
    contact_email = models.CharField(max_length=200, null=False)
    subject = models.CharField(max_length=50, null=False)
    message = models.TextField(null=False)

    class Meta:
        db_table = 'contactus'