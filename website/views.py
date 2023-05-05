from flask import Blueprint, render_template, request, flash, jsonify
from flask_login import login_required, current_user
import json

views = Blueprint("views", __name__)


# this will run every time we go to home
@views.route("/", methods=["GET", "POST"])
@login_required
def home():
    if current_user.is_anonymous:
        return render_template("login.html")
    else:
        return render_template("home.html", user = current_user)
