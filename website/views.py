from flask import Blueprint, render_template

views = Blueprint('views', __name__)


@views.route('/')  # this will run every time we go to home
def home():
    return render_template("home.html")
