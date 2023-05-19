from flask import Blueprint, render_template, request, flash, jsonify, url_for, session
from flask_login import login_required, current_user
from . import db
import json, base64, os

views = Blueprint("views", __name__)


# this will run every time we go to home
@views.route("/", methods=["GET", "POST"])
@login_required
def home():
    if current_user.is_anonymous:
        return render_template("login.html")
    else:
        cur = db.connection.cursor()
        id=current_user.get_id()
        cur.execute("SELECT school.id, school.appellation FROM app_user JOIN school ON app_user.school = school.id WHERE app_user.id = %s", (id,))
        school = cur.fetchone()
        cur.close()
        session["school_name"]= school[1]
        session["school_id"]= school[0]
        return render_template("home.html", user = current_user)
    
@views.route("/books", methods=["GET", "POST"])
@login_required
def books():
    if current_user.is_anonymous:
        return render_template("login.html")
    else:
        user_id = current_user.get_id()
        cur = db.connection.cursor()
        cur.execute("SELECT b.title, COUNT(bcps.id) AS copy_count, b.image, b.id FROM app_user AS au JOIN school AS s ON au.school = s.id JOIN book_copies_per_school AS bcps ON s.id = bcps.school_id JOIN book AS b ON bcps.book_id = b.id WHERE au.id = %s GROUP BY b.title", [user_id])
        rows = cur.fetchall()
        cur.close()
        
        modified_rows=[]
        image_url=[]
        ids=[]
                   
        for index, row in enumerate(rows):
            ids.append(row[3]-1)
            """
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
            
            image_url.append(url_for('static', filename=f'images/{ids[index]}.png'))

        school_name=session["school_name"]

        return render_template("books.html", user = current_user, rows=rows, image_url=image_url, school = school_name)

@views.route("/books/<book_id>", methods=["GET", "POST"])
@login_required
def book_page(book_id):
    if current_user.is_anonymous:
        return render_template("login.html")
    else:
        user_id = current_user.get_id()

        #Get all info about book
        cur = db.connection.cursor()
        cur.execute(f"SELECT * FROM book WHERE book.id = {book_id}")
        book_info = cur.fetchone()
        cur.close()

        return render_template("book_page.html", user=current_user, book_id=book_id, book_name=book_info[1])

@views.route("/queries", methods=["GET", "POST"])
@login_required
def queries():
    return render_template("queries.html", user=current_user)