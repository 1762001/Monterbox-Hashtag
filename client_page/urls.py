from django.contrib import admin
from django.urls import *
from client_page import client_views


urlpatterns = [
    path('home',client_views.home),
    path('client_login',client_views.login),
    path('client_logout', client_views.logout),
    path('client_registration', client_views.insert_user),
    path('forgot', client_views.forgot),
    path('send_otp', client_views.send_email),
    path('reset',client_views.set_password),
    path('shop',client_views.display_shop),
    path('product-detail/<int:id>',client_views.product_detail),
    path('cart',client_views.view_cart),
    path('insert_cart', client_views.insert_cart),
    path('order',client_views.select_order),
    path('checkout/<int:total>', client_views.checkout2),
    path('order_detail/<int:id>', client_views.view_order_detail),
    path('delete/<int:id>', client_views.delete_cart),
    path('edit_profile',client_views.edit_profile),
    path('update_profile',client_views.update_profile),
    path('games', client_views.view_games),
    path('view-tourney/<int:id>', client_views.view_tournaments),
    path('view-t-detail/<int:id>', client_views.view_t_detail),
    path('my_tournaments',client_views.view_m_tourney),
    path('register-tournament/<int:id>', client_views.register_tournament),
    path('participate/<int:id>',client_views.participate),
    path('feedback/<int:id>',client_views.insert_feedback),
    path('shop/cat/<int:id>', client_views.view_by_cat),
    path('category',client_views.view_category),
    path('notifications',client_views.test),
    path('subscribe', client_views.subscribe),
    path('contact_us', client_views.contact_us),
    path('failure',client_views.failure),
    path('success/<int:id>', client_views.success),
    path('edit-order/<int:id>', client_views.edit_order),
    path('update-order/<int:id>',client_views.update_order),

]