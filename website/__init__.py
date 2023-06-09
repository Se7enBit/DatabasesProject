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
app.config["MYSQL_DB"] = "school_library"
app.config["MYSQL_USER"] = "root"
#app.config["MYSQL_PASSWORD"] = ""
app.config["MYSQL_HOST"] = "localhost"
app.config['MYSQL_CHARSET'] = 'utf8mb4'
app.config['SQLALCHEMY_ECHO'] = True #Uncomment to see querry outputs

db = MySQL(app)

login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = "auth.login"

from .views import views
from .auth import auth
from .queries import queries

app.register_blueprint(views, url_prefix="/")
app.register_blueprint(auth, url_prefix="/")
app.register_blueprint(queries, url_prefix="/")