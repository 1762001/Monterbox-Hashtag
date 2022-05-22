"""finalproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path , include
from admin_page import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('index/', views.index),
    path('login/', views.login),
    path('logout/', views.logout),

    path('select-user/', views.select_user),
    path('select-category/', views.select_category),
    path('select-product/', views.select_product),
    path('select-order/', views.select_order),
    path('select-payment/', views.select_payment),
    path('select-feedback/', views.select_feedback),
    path('select-game/', views.select_game),
    path('select-tournament/', views.select_tournament),
    path('select-team/', views.select_team),
    path('select-player/', views.select_player),
    path('select-contactus/', views.select_contactus),


    path('categorydelete/<int:id>', views.delete_category),
    path('productdelete/<int:id>', views.delete_product),
    path('gamedelete/<int:id>', views.delete_game),
    path('tournamentdelete/<int:id>', views.delete_tournament),

    path('category-insert/', views.insert_category),
    path('product-insert/', views.insert_product),
    path('game-insert/', views.insert_game),
    path('tournament-insert/', views.insert_tournament),

    path('productupdate/<int:id>', views.update_product),
    path('edit_product/<int:id>', views.edit_product),
    path('categoryupdate/<int:id>', views.update_category),
    path('edit_category/<int:id>', views.edit_category),
    path('gameupdate/<int:id>', views.update_game),
    path('edit_game/<int:id>', views.edit_game),
    path('edit-profile/', views.edit_profile),
    path('update-profile/', views.update_profile),
    path('tournamentupdate/<int:id>', views.update_tournament),
    path('edit_tournament/<int:id>', views.edit_tournament),

    path('forgot/', views.forgot_password),
    path('send_otp/', views.send_email),
    path('reset/', views.set_password),
    path('change-password/',views.change_password),

    path('order-detail/<int:id>', views.order_detail),
    path('accept/<int:id>', views.accept),
    path('reject/<int:id>', views.reject),
    path('test/',views.test),

    path('send-notification/<int:id>', views.send_notification),
    path('oreport/',views.order_report),
    path('filter/<int:id>',views.filter),
    path('oreport2/',views.count_total),
    path('greport3/', views.tournament_report),
    path('greport4/', views.player_report),
    path('date_filter/',views.filter_by_date),
    path('filter1',views.filter_by_date),
    path('filter1/<int:id>', views.apply_filter_status),
    path('paid/<int:id>',views.paid),
    path('upload-score/<int:id>', views.upload_score),
    path('edit-score/<int:id>', views.edit_score_team),
    path('edit-score-player/<int:id>',views.edit_score_player),
    path('client_page/', include('client_page.urls'))

    ]
