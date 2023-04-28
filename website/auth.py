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
from . import login_manager

auth = Blueprint("auth", __name__)


def authenticate():
    db = current_app.config["MYSQL_DB"]
    if "username" not in session:
        return render_template("login.html")

    username = session["username"]

    cur = db.connection.cursor()
    cur.execute("SELECT role FROM users WHERE username=%s", [username])
    user_role = cur.fetchone()

    if user_role not in ["student", "teacher", "librarian", "admin"]:
        return render_template("login.html")

    return user_role


class User:
    def __init__(self, user_id, username, email, password):
        self.id = user_id
        self.username = username
        self.email = email
        self.password = password

    def get_id(self):
        return self.id

    @staticmethod
    def get(user_id):
        db = current_app.config["MYSQL_DB"]
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM users WHERE id = %s", [user_id])
        user = cur.fetchone()
        cur.close()

        if user:
            return User(user["id"], user["username"], user["email"], user["password"])
        return None

    @staticmethod
    def authenticate(username, password):
        db = current_app.config["MYSQL_DB"]
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM users WHERE username = %s", [username])
        user = cur.fetchone()
        cur.close()

        authorized_user = User(
            user["id"], user["username"], user["email"], user["password"]
        )
        if check_password_hash(user.password, password):
            return authorized_user
        return None


@auth.route("/login", methods=["GET", "POST"])
def login():
    if current_user.is_authenticated:
        return redirect(url_for("views.home"))
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]
        user = User.authenticate(username, password)

        if not user:
            flash("Invalid username or password", category="error")
            return render_template("login.html", user=current_user)
        login_user(user, remember=True)
        return redirect(url_for("views.home"))
    return render_template("login.html")


@auth.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for("auth.login"))


@auth.route("/sign-up", methods=["GET", "POST"])
def sign_up():
    if request.method == "POST":
        email = request.form.get("email")
        username = request.form.get("username")
        password1 = request.form.get("password1")
        password2 = request.form.get("password2")

        cur = db.connection.cursor()
        cur.execute("SELECT * FROM users WHERE email = %s", [email])
        user_email = cur.fetchone()
        cur.close()

        if user_email:
            flash("Email already exists.", category="error")
        elif len(email) < 4:
            flash("Email must be greater than 3 characters.", category="error")
        elif len(username) < 4:
            flash("Username must be greater than 3 character.", category="error")
        elif password1 != password2:
            flash("Passwords don't match.", category="error")
        elif len(password1) < 7:
            flash("Password must be at least 7 characters", category="error")
        else:
            # add user to database
            password = generate_password_hash(password1, method="sha256")
            db = current_app.config["MYSQL_DB"]
            cur = db.connection.cursor()
            cur.execute(
                "INSERT INTO users (username, email, password) VALUES (%s, %s)",
                (username, email, password),
            )
            db.connection.commit()
            cur.close()

            user = User.authenticate(username, password)
            login_user(user, remember=True)
            flash("Account created.", category="success")
            return redirect(url_for("views.home"))
    return render_template("sign_up.html", user=current_user)


@login_manager.user_loader
def load_user(user_id):
    db = current_app.config["MYSQL_DB"]
    cur = db.connection.cursor()
    cur.execute("SELECT * FROM users WHERE id = %s", (user_id,))
    user = cur.fetchone()
    cur.close()
    if user:
        return User(user["id"], user["username"], user["email"], user["password"])
