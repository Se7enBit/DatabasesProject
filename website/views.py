from flask import Blueprint, render_template, request, flash, jsonify
from flask_login import login_required, current_user
from . import db
import json, base64

views = Blueprint("views", __name__)


# this will run every time we go to home
@views.route("/", methods=["GET", "POST"])
@login_required
def home():
    if current_user.is_anonymous:
        return render_template("login.html")
    else:
        return render_template("home.html", user = current_user)
    
@views.route("/books", methods=["GET", "POST"])
@login_required
def books():
    if current_user.is_anonymous:
        return render_template("login.html")
    else:
        user_id = current_user.get_id()
        cur = db.connection.cursor()
        cur.execute("SELECT b.title, COUNT(bcps.id) AS copy_count, b.image FROM app_user AS au JOIN school AS s ON au.school = s.id JOIN book_copies_per_school AS bcps ON s.id = bcps.school_id JOIN book AS b ON bcps.book_id = b.id WHERE au.id = %s GROUP BY b.title", [user_id])
        rows = cur.fetchall()
        cur.close()
        
        """
        modified_rows=[]
        for row in rows:
            row_list = list(row)
            image_blob = row_list[2]
            if image_blob:
                # Convert the image BLOB to Base64 encoding
                image_base64 = base64.b64encode(image_blob).decode('utf-8')
                row_list[2] = image_base64
            else:
                row_list[2] = None
            modified_row = tuple(row_list)
            modified_rows.append(modified_row)
        """

        cur = db.connection.cursor()
        cur.execute("SELECT s.appellation FROM app_user AS au JOIN school AS s ON au.school = s.id WHERE au.id = %s", [user_id])
        school = cur.fetchone()
        cur.close()

        return render_template("books.html", user = current_user, rows=rows, school = school)
