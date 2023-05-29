from flask import Blueprint, render_template, request, flash, jsonify, url_for, session, redirect, send_file
from flask_login import login_required, current_user
from . import db
import json, base64, os
from datetime import datetime, date

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
        cur.execute(f"SELECT s.id AS school_id, s.appellation AS school_appellation, au.user_role AS user_role FROM app_user AS au JOIN school AS s ON au.school = s.id WHERE au.id = {id};")
        info = cur.fetchone()
        cur.close()
        session["school_id"]= info[0]
        session["school_name"]= info[1]
        session["user_role"]=info[2]
        
        #Here you can add any data that you want to pass to the home page
        data={}
        img_for_returned = None
        img_for_rented = None

        #STUDENT AND TEACHER
        if session["user_role"] in ["student", "teacher"]:
            cur = db.connection.cursor()
            cur.execute(f"""select book.*, book_rental.request_datetime, book_rental.rental_datetime, book_rental.return_datetime, book_rental.rental_status
                        from book join book_rental ON book.id = book_rental.book_id
                        where book_rental.app_user_id = {id} and book_rental.rental_status in ("reservation", "rented", "late to return", "returned");""")
            rented_books = cur.fetchall()
            cur.close()
            img_for_rented=[]
            img_for_returned=[]
            ids_rented =[]
            ids_returned=[]
            i=0
            j=0
            #[13] gives the status
            for rented_book in rented_books:
                if rented_book[13] == "rented":
                    ids_rented.append(rented_book[0]-1)
                    img_for_rented.append(url_for('static', filename=f'images/{ids_rented[i]}.png'))
                    i = i+1
                elif rented_book[13] == "returned":
                    ids_returned.append(rented_book[0]-1)
                    img_for_returned.append(url_for('static', filename=f'images/{ids_returned[j]}.png'))
                    j=j+1
            
            #doesnt work cause after that mike 

            data["rented"] = [book for book in rented_books if book[-1] in ["reservation", "rented", "late to return"]]
            data["returned"] = [book for book in rented_books if book[-1] == "returned"]
            data["num_rented"] = len(data["rented"])
            data["num_returned"] = len(data["returned"])
            
            #!Use the data dictionary to pass any data to home page
            return render_template("home.html", user = current_user, role=session["user_role"], data=data, img_for_returned=img_for_returned, img_for_rented=img_for_rented)

        #SCHOOL ADMIN
        elif session["user_role"] == "school_admin":
            school=session["school_name"]
            school_id=session["school_id"]
            inactive_users = None
            unpublished_ratings = None

            cur = db.connection.cursor()
            cur.execute(f"SELECT * FROM app_user WHERE school = {school_id} AND is_active = 0;")
            inactive_users= cur.fetchall()
            cur.close()

            cur = db.connection.cursor()
            cur.execute(f"SELECT br.id AS rating_id, b.title AS book_title, au.username, br.rating, br.comments FROM book_rating AS br INNER JOIN book AS b ON br.book_id = b.id INNER JOIN app_user AS au ON br.app_user_id = au.id WHERE br.is_published = 0 AND au.school = {school_id};")
            unpublished_ratings= cur.fetchall()
            cur.close()
            print(unpublished_ratings)

            return render_template("librarian.html",user=current_user, school=school, users=inactive_users, ratings=unpublished_ratings, role=session["user_role"])

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

        return render_template("books.html", user = current_user, rows=rows, image_url=image_url, school = school_name, role=session["user_role"])

@views.route("/books/<book_id>", methods=["GET", "POST"])
@login_required
def book_page(book_id):
    if current_user.is_anonymous:
        return render_template("login.html")
    else:
        user_id = current_user.get_id()
        school_id = session["school_id"]

        #Get all info about book
        cur = db.connection.cursor()
        cur.execute(f"SELECT * FROM book WHERE book.id = {book_id}")
        book_info = cur.fetchone()
        cur.close()
        im_number = str(int(book_id)-1)
        image_url = url_for("static", filename=f"images/{im_number}.png")

        #Get book writer
        cur = db.connection.cursor()
        cur.execute(f"SELECT first_name, last_name FROM writer JOIN book_writer ON writer.id=book_writer.writer_id WHERE book_writer.book_id={book_id}")
        writer_full = cur.fetchone()
        cur.close()
        writer = writer_full[0]+" "+writer_full[1]

        #Get copies and available copies
        cur = db.connection.cursor()
        cur.execute(f"SELECT COUNT(bcps.id) FROM book_copies_per_school AS bcps WHERE bcps.school_id={school_id} AND bcps.book_id={book_id};")
        available=[cur.fetchone()[0]]
        cur.execute(f"SELECT COUNT(*) FROM book_copies_per_school AS bcps WHERE bcps.school_id={school_id} AND bcps.book_id={book_id} AND bcps.availability=1;")
        available.append(cur.fetchone()[0])
        cur.close()

        #Get book ratings
        cur = db.connection.cursor()
        cur.execute(f"SELECT username, rating, comments, rating_datetime, app_user.id FROM book_rating JOIN app_user ON app_user.id=book_rating.app_user_id WHERE book_id={book_id} AND is_published=1")
        ratings = cur.fetchall()
        cur.close()
        average_rating=0
        for row in ratings: average_rating += int(row[1])
        if len(ratings)!=0: average_rating/=len(ratings)
        average_rating=round(average_rating, 1)

        #This loads when you post a comment:
        if request.method=="POST" and "comment" in request.form and "rating" in request.form:
            if any(row[4]==user_id for row in ratings):
                flash("You have already posted a rating for this book", category='error')
            else:
                rating = request.form.get("rating")
                comment = request.form.get("comment")
                cur = db.connection.cursor()
                is_published = 0
                if session["user_role"] == 'teacher':
                    is_published = 1
                print(f"""Running querry: INSERT INTO book_rating (book_id, app_user_id, rating, comments, is_published) VALUES ({book_id}, {user_id}, '{rating}', '{comment}', {is_published});""")
                cur.execute(f"""INSERT INTO book_rating (book_id, app_user_id, rating, comments, is_published) VALUES ({book_id}, {user_id}, '{rating}', '{comment}', {is_published});""")
                db.connection.commit()
                cur.close()
                flash("Your rating has been posted!", category='info')
                return redirect(url_for('views.book_page', book_id= book_id))

        return render_template("book_page.html", user=current_user, book_id=book_info[0],
                               name=book_info[1], publisher=book_info[2], isbn=book_info[3],
                               num_pages=book_info[4], categories=book_info[5], abstract=book_info[6],
                               language=book_info[7], image_url=image_url, keywords=book_info[9], writer=writer,
                               available=available, rating=average_rating, comments=ratings, num_comments=len(ratings), role=session["user_role"])


@views.route("/queries", methods=["GET", "POST"])
@login_required
def queries():
    cur= db.connection.cursor()
    cur.execute("SELECT DISTINCT category FROM book;")
    results = cur.fetchall()
    cur.close()
    cats = set()
    for result in results:
        category_set = set(result[0].split(','))
        cats.update(category_set)
    categories = sorted(cats)
    session["categories"] = categories

    #Get School users
    cur = db.connection.cursor()
    cur.execute(f"""SELECT id, username FROM app_user WHERE school="{session['school_id']}" ORDER BY username;""")
    school_users = cur.fetchall()
    session["school_users"]=[]
    for user in school_users: session["school_users"].append(user)
    cur.close()
    
    return render_template("queries.html", user=current_user, role=session["user_role"], 
                           categories=categories, school_users=session["school_users"])

@views.route("/school-admin", methods=["GET", "POST"])
@login_required
def school_admin():
    role=session["user_role"]
    if role != 'school_admin':
        return redirect(url_for("views.home"))
    else:
        school=session["school_name"]
        school_id=session["school_id"]
        inactive_users = None
        unpublished_ratings = None

        cur = db.connection.cursor()
        cur.execute(f"SELECT * FROM app_user WHERE school = {school_id} AND is_active = 0;")
        inactive_users= cur.fetchall()
        cur.close()

        cur = db.connection.cursor()
        cur.execute(f"SELECT br.id AS rating_id, b.title AS book_title, au.username, br.rating, br.comments FROM book_rating AS br INNER JOIN book AS b ON br.book_id = b.id INNER JOIN app_user AS au ON br.app_user_id = au.id WHERE br.is_published = 0 AND au.school = {school_id};")
        unpublished_ratings= cur.fetchall()
        cur.close()
        print(unpublished_ratings)

        return render_template("librarian.html",user=current_user, school=school, users=inactive_users, ratings=unpublished_ratings, role=session["user_role"])

@views.route("/set-active", methods=["POST"])
@login_required
def set_active():
    if session["user_role"] == "school_admin":
        user_id = request.form.get("user_id")
        cur = db.connection.cursor()
        cur.execute(f"UPDATE app_user SET is_active = 1 WHERE id = '{user_id}';")
        db.connection.commit()
        cur.close()
        flash("User activated succesfully", category="success")

    return redirect(url_for("views.school_admin"))

@views.route("/publish-rating", methods=["POST"])
@login_required
def publish_rating():
    if session["user_role"] == "school_admin":
        rating_id = request.form.get("rating_id")
        cur = db.connection.cursor()
        cur.execute(f"UPDATE book_rating SET is_published = 1 WHERE id = {rating_id};")
        db.connection.commit()
        cur.close()
        flash("Rating published succesfully", category="success")

    return redirect(url_for("views.school_admin"))


@views.route("/profile", methods=["GET", "POST"])
@login_required
def profile():
    if request.method == "POST":
        user =  session["username"]

        if "name" in request.form:
            new_name = request.form.get("name")
            new_lastname = request.form.get("lastname")
            if new_name and new_lastname:
                cur = db.connection.cursor()
                cur.execute("UPDATE app_user SET first_name= %s, last_name= %s WHERE username= %s;", (new_name, new_lastname, user))
                db.connection.commit()
                cur.close()
            else:
                flash("Try Again.", category="error")
                return redirect(url_for('views.profile'))  

        if "birthdate" in request.form:
            new_bdate= request.form.get("birthdate")
            date_object = datetime.strptime(new_bdate, "%Y-%m-%d")
            current_year = date.today().year

            if current_year - date_object.year < 18:
                flash("Dear teacher, you cant be less than 18 years old.", category="error")
                return redirect(url_for('views.profile'))
            else:  
                cur = db.connection.cursor()
                cur.execute("UPDATE app_user SET birthdate= %s WHERE username= %s;", (new_bdate, user))
                db.connection.commit()
                cur.close()
        
        if "username" in request.form:
            new_username = request.form.get("username")
            cur = db.connection.cursor()
            cur.execute("SELECT username FROM app_user;")
            result=cur.fetchall()
            cur.close()
            users=list(result)

            if len(new_username) < 4:
                flash("Username must be greater than 3 character.", category="error")
                return redirect(url_for('views.profile'))
            elif new_username in users:
                flash("Username already exists.", category="error")
                return redirect(url_for('views.profile'))
            else:
                cur = db.connection.cursor()
                cur.execute("UPDATE app_user SET username= %s WHERE username= %s;", (new_username, user))
                db.connection.commit()
                cur.close()

                session["username"]= new_username
        
        flash("Info updated succesfully.", category="success")
        return redirect(url_for('views.home'))
    else:
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM app_user WHERE username = %s;", (current_user.username,))
        result= cur.fetchone()
        cur.close()
        info = []
        info.append(result[1])
        info.append(result[2])
        info.append(result[3])
        return render_template("profile.html", user=current_user, school=session["school_name"], info=info, role=session["user_role"])