from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import (
    LoginManager,
    login_user,
    logout_user,
    login_required,
    current_user,
)

app = Flask(__name__)
app.config["SECRET_KEY"] = "dbdbdbdb"

app.config["MYSQL_USER"] = "username"
app.config["MYSQL_PASSWORD"] = "password"
app.config["MYSQL_DB"] = "school_library"
app.config["MYSQL_HOST"] = "localhost"

db = MySQL(app)

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = "auth.login"

from .views import views
from .auth import auth

app.register_blueprint(views, url_prefix="/")
app.register_blueprint(auth, url_prefix="/")
