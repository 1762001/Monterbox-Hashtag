from django import forms
from admin_page.models import *
from parsley.decorators import parsleyfy


@parsleyfy
class CategoryForm(forms.ModelForm):
    c_image = forms.FileField()
    class Meta:
        model = Category
        fields = ["c_name", "c_image"]


@parsleyfy
class ProductForm(forms.ModelForm):
    p_image = forms.FileField()
    class Meta:
        model = Product
        fields = ["p_name", "p_price", "p_desc", "in_stock", "p_image", "c_id"]


@parsleyfy
class GameForm(forms.ModelForm):
    wallpaper = forms.FileField()
    class Meta:
        model = Game
        fields = ["game_name", "platform", "wallpaper"]


@parsleyfy
class UsersForm(forms.ModelForm):
    class Meta:
        model = Users
        fields = ["user_name", "email", "contact", "user_dob", "user_gender"]


@parsleyfy
class PlayerFrom(forms.ModelForm):
    class Meta:
        model = Player
        fields = ["player_name", "t_id", "user_id", "is_main"]


@parsleyfy
class TournamentForm(forms.ModelForm):
    class Meta:
        model = Tournament
        fields = ["t_name", "t_desc", "player_limit", "team_limit",
                  "start_date", "reg_open", "finish_date", "game_id",
                  "activate_result"]


@parsleyfy
class FeedbackForm(forms.ModelForm):
    class Meta:
        model = Feedback
        fields = ["f_desc","f_date","p_id","user_id"]


@parsleyfy
class TeamForm(forms.ModelForm):
    class Meta:
        model = Team
        fields = ["team_name","team_score","no_of_player","t_id"]


@parsleyfy
class ContactusForm(forms.ModelForm):
    class Meta:
        model = Contactus
        fields = ['contact_name','contact_email','subject','message']