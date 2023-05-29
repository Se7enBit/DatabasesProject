from flask import (
    Blueprint,
    render_template,
    request,
    flash,
    redirect,
    url_for,
    session,
    current_app,
)
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import (
    login_required,
    login_user,
    logout_user,
    current_user,
)
from . import login_manager, db
import hashlib

auth = Blueprint("auth", __name__)

class User():
    def __init__(self, user_id, username, password, is_active, is_authenticated=False, is_anonymous=False):
        self.id = user_id
        self.username = username
        self.password = password
        self.is_active = is_active
        self.is_authenticated = is_authenticated
        self.is_anonymous = is_anonymous

    def get_id(self):
        return self.id

    @staticmethod
    def get(user_id):
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM app_user WHERE id = %s", [user_id])
        user = cur.fetchone()
        cur.close()

        if user:
            return User(user[0], user[7], user[8], user[6])
        return None

    @staticmethod
    def authenticate(username, password):
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM app_user WHERE username = %s", [username])
        user = cur.fetchone()
        cur.close()

        if user:
            authenticated_user = User(
            user[0], user[7], user[8], user[6], True
        )
            #if check_password_hash(user[8], password):
            if (user[8]==password):
                return authenticated_user
        else:
            return None

@auth.route("/login", methods=["GET", "POST"])
def login():
    session.clear()
    if current_user.is_authenticated:
        return redirect(url_for("views.home"))
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        md5_password = hashlib.md5(password.encode()).hexdigest()
        user = User.authenticate(username, md5_password)

        if not user:
            flash("Invalid username or password", category="error")
            return render_template("login.html")
        
        if not user.is_active:
            session["username"]=username
            session["password"]=hashlib.md5(password.encode()).hexdigest()
            return redirect(url_for("auth.waiting_room"))
        session["username"]=username
        login_user(user, remember=True)
        return redirect(url_for("views.home"))
    return render_template("login.html")


@auth.route("/logout")
@login_required
def logout():
    session.clear()
    logout_user()
    return redirect(url_for("auth.login"))


@auth.route("/sign-up", methods=["GET", "POST"])
def sign_up():
    session.clear()
    cur = db.connection.cursor()
    cur.execute("SELECT * FROM school")
    schools = cur.fetchall()
    cur.close()

    if request.method == "POST":
        first_name = request.form.get("first_name")
        last_name = request.form.get("last_name")
        birthdate = request.form.get("birthdate") #schould be a birthdate form
        school = request.form.get("school") #returns school.id
        user_role = request.form.get("user_role") #select from 3 options

        username = request.form.get("username")
        password1 = request.form.get("password1")
        password2 = request.form.get("password2")

        cur = db.connection.cursor()
        cur.execute("SELECT * FROM app_user WHERE username = %s", [username])
        app_user = cur.fetchone()
        cur.close()

        if app_user:
            flash("Username already exists.", category="error")
        if len(username) < 4:
            flash("Username must be greater than 3 characters.", category="error")
        elif password1 != password2:
            flash("Passwords don't match.", category="error")
        elif len(password1) < 7:
            flash("Password must be at least 7 characters", category="error")
        else:
            # add user to database
            #password = generate_password_hash(password1, method="sha256")
            cur = db.connection.cursor()
            cur.execute(
                "INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, username, userpassword) VALUES (%s, %s, %s, %s, %s, %s, md5(%s))",
                (first_name, last_name, birthdate, school, user_role, username, password1),
            )
            db.connection.commit()
            cur.close()


            flash("Account created.", category="success")
            session["username"]=username
            session["password"]=password1
            return redirect(url_for("auth.waiting_room"))
  
    return render_template("sign_up.html", user=current_user, schools=schools)
    

@auth.route("/waiting-room")
def waiting_room():
    username = session.get("username")
    password = session.get("password")
    user = User.authenticate(username, password)
    if user:
        if user.is_active:
            login_user(user, remember=True)
            return redirect(url_for("views.home"))
        else:    
            return render_template("waiting_room.html")
            
    else:
        return redirect(url_for("auth.login"))


@login_manager.user_loader
def load_user(user_id):
    cur = db.connection.cursor()
    cur.execute("SELECT * FROM app_user WHERE id = %s", (user_id,))
    user = cur.fetchone()
    cur.close()
    if user:
        return User(user[0], user[7], user[8], user[6], True)
