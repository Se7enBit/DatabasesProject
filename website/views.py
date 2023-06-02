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
        if current_user.get_id() == 1:
            return redirect(url_for("views.admin"))
        cur = db.connection.cursor()
        id=current_user.get_id()
        cur.execute(f"SELECT s.id AS school_id, s.appellation AS school_appellation, au.user_role AS user_role FROM app_user AS au JOIN school AS s ON au.school = s.id WHERE au.id = {id};")
        info = cur.fetchone()
        cur.close()
        session["school_id"]= info[0]
        session["school_name"]= info[1] 
        session["user_role"]= info[2]
        
        #Here you can add any data that you want to pass to the home page
        data={}
        img_for_returned = None
        img_for_rented = None

        #STUDENT AND TEACHER
        if session["user_role"] in ["student", "teacher"]:
            cur = db.connection.cursor()
            cur.execute(f"""select book.*, book_rental.request_datetime, book_rental.rental_datetime, book_rental.return_datetime, book_rental.rental_status
                        from book join book_rental ON book.id = book_rental.book_id
                        where book_rental.app_user_id = {id} and book_rental.rental_status in ("reservation", "rented", "late to return", "returned") AND book_rental.is_active=1;""")
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
                if rented_book[13] in ("rented", "reservation", "late to return"):
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
            return redirect(url_for("views.school_admin"))

@views.route("/books", methods=["GET", "POST"])
@login_required
def books():
    if current_user.is_anonymous:
        return render_template("login.html")
    
    if current_user.get_id() == 1:
        return redirect(url_for("views.admin"))
    user_id = current_user.get_id()
    query=f"""SELECT b.title, COUNT(bcps.id) AS copy_count, b.image, b.id FROM app_user AS au JOIN school AS s ON au.school = s.id JOIN book_copies_per_school AS bcps ON s.id = bcps.school_id JOIN book AS b ON bcps.book_id = b.id WHERE au.id = {user_id} GROUP BY b.title"""
    
    if "search-option" in request.form:
        search_option = request.form.get("search-option")
        if search_option == "titleCheckbox":
            book_title = request.form.get("book_title")
            query = f"SELECT b.title, COUNT(bcps.id) AS copy_count, b.image, b.id FROM app_user AS au JOIN school AS s ON au.school = s.id JOIN book_copies_per_school AS bcps ON s.id = bcps.school_id JOIN book AS b ON bcps.book_id = b.id WHERE au.id = {user_id} AND b.title LIKE '%{book_title}%'GROUP BY b.title"
        elif search_option == "categoryCheckbox":
            category = request.form.get("category")
            query = f"SELECT b.title, COUNT(bcps.id) AS copy_count, b.image, b.id FROM app_user AS au JOIN school AS s ON au.school = s.id JOIN book_copies_per_school AS bcps ON s.id = bcps.school_id JOIN book AS b ON bcps.book_id = b.id WHERE au.id = {user_id} AND FIND_IN_SET('{category}', category) GROUP BY b.title"
        elif search_option == "writerCheckbox":
            book_writer = request.form.get("book_writer")
            query = f"SELECT b.title, COUNT(bcps.id) AS copy_count, b.image, b.id  FROM app_user AS au  JOIN school AS s ON au.school = s.id  JOIN book_copies_per_school AS bcps ON s.id = bcps.school_id  JOIN book AS b ON bcps.book_id = b.id  JOIN book_writer bw ON bw.book_id = b.id JOIN writer w ON bw.writer_id=w.id WHERE au.id = {user_id} AND w.first_name LIKE '%{book_writer}%' OR w.last_name LIKE '%{book_writer}%' GROUP BY b.title"

    cur = db.connection.cursor()
    cur.execute(query)
    rows = cur.fetchall()
    cur.close()
    
    image_url=[]
    ids=[]
               
    for index, row in enumerate(rows):
        ids.append(row[3]-1)        
        image_url.append(url_for('static', filename=f'images/{ids[index]}.png'))

    school_name=session["school_name"]

    #get categories
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

    return render_template("books.html", user = current_user, rows=rows, image_url=image_url, 
                               school = school_name, role=session["user_role"], categories=session["categories"])

@views.route("/books/<book_id>", methods=["GET", "POST"])
@login_required
def book_page(book_id):
    if current_user.is_anonymous:
        return render_template("login.html")
    else:
        if current_user.get_id() == 1:
            return redirect(url_for("views.admin"))
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
        writer_full = cur.fetchall()
        cur.close()
        writer_list = [w_f[0]+" "+w_f[1] for w_f in writer_full]
        writer = ", ".join(writer_list)

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
                cur.execute(f"""INSERT INTO book_rating (book_id, app_user_id, rating, comments, is_published) VALUES ({book_id}, {user_id}, '{rating}', '{comment}', {is_published});""")
                db.connection.commit()
                cur.close()
                flash("Rating submitted succesfully! It will be published when your school admin approves it.", category="success")
                return redirect(url_for('views.book_page', book_id= book_id))

        return render_template("book_page.html", user=current_user, user_role=session["user_role"], book_id=book_info[0],
                               name=book_info[1], publisher=book_info[2], isbn=book_info[3],
                               num_pages=book_info[4], categories=book_info[5], abstract=book_info[6],
                               language=book_info[7], image_url=image_url, keywords=book_info[9], writer=writer,
                               available=available, rating=average_rating, comments=ratings, num_comments=len(ratings), role=session["user_role"])

@views.route("/queries", methods=["GET", "POST"])
@login_required
def queries():
    if current_user.get_id() == 1:
        return redirect(url_for("views.admin"))
    if session["user_role"] != "school_admin":
        return redirect(url_for("views.home"))

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
    arg=""
    if request.method=="POST" and "manage-user-name" in request.form:
        name=request.form.get("manage-user-name")
        arg=f" AND username LIKE '%{name}%' OR first_name LIKE '%{name}%' OR last_name LIKE '%{name}%'"
    cur = db.connection.cursor()
    cur.execute(f"""SELECT id, username, first_name, last_name, user_role FROM app_user WHERE school={session['school_id']} AND is_active=1 AND user_role IN ('student', 'teacher'){arg} ORDER BY username;""")
    school_users = cur.fetchall()
    session["school_users"]=[]
    for user in school_users: session["school_users"].append(user)
    cur.close()  

    #Deactivate / Delete User
    if request.method=="POST" and "user-action" in request.form:
        user_id = request.form.get("user-id")
        action=None
        message=None
        if request.form.get("user-action") == "deactivate":
            action=f"UPDATE app_user SET is_active=0 WHERE id={user_id}"
            message=f"User {user_id} DEACTIVATED successfully"
        elif request.form.get("user-action") == "delete":
            #Check if user has active rentals
            cur = db.connection.cursor()
            cur.execute(f"""SELECT id FROM book_rental WHERE app_user_id={user_id} AND rental_status IN ("rented", "reservation", "late to return")""")
            user_book_rentals = cur.fetchall()
            cur.close()
            if len(user_book_rentals) > 0:
                flash("To delete this user there must be no active rentals or reservations", category='error')
            else:
                action=f"DELETE FROM app_user WHERE id={user_id}"
                message=f"User {user_id} DELETED successfully"
        if action and message:
            cur = db.connection.cursor()
            cur.execute(action)
            db.connection.commit()
            cur.close()
            flash(message, category="success")

    #Manage Rentals
    arg=""
    if request.method=="POST" and "rental-user-name" in request.form:
        name=request.form.get("rental-user-name")
        arg=f" AND u.username LIKE '%{name}%'"
    cur = db.connection.cursor()
    cur.execute(f"""SELECT br.id AS rental_id, u.username, b.title, br.rental_datetime, br.book_copy_id FROM book_rental br JOIN app_user u ON u.id=br.app_user_id JOIN book b ON b.id=br.book_id WHERE u.school={session["school_id"]} AND br.rental_status='rented' AND br.is_active=1{arg};""")
    rented_books = cur.fetchall()
    cur.execute(f"""SELECT br.id AS rental_id, u.username, b.title, br.reservation_datetime, br.book_copy_id FROM book_rental br JOIN app_user u ON u.id=br.app_user_id JOIN book b ON b.id=br.book_id WHERE u.school={session["school_id"]} AND br.rental_status='reservation' AND br.is_active=1{arg};""")
    reserved_books = cur.fetchall()
    cur.close()

    return render_template("queries.html", user=current_user, role=session["user_role"], rented_books=rented_books,
                           reserved_books=reserved_books, categories=categories, school_users=session["school_users"])

@views.route("/queries-admin", methods=["GET", "POST"])
@login_required
def queries_admin():
    if current_user.get_id() != 1:
        return redirect(url_for("views.home"))
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
    
    return render_template("queries_admin.html", user=current_user, categories=categories)

@views.route("/school-admin", methods=["GET", "POST"])
@login_required
def school_admin():
    if current_user.get_id() == 1:
        return redirect(url_for("views.admin"))
    role=session["user_role"]
    if role != 'school_admin':
        return redirect(url_for("views.home"))
    else:
        school=session["school_name"]
        school_id=session["school_id"]
        inactive_users = None
        unpublished_ratings = None

        #Find unpublished ratings
        cur = db.connection.cursor()
        cur.execute(f"SELECT br.id AS rating_id, b.title AS book_title, au.username, br.rating, br.comments FROM book_rating AS br INNER JOIN book AS b ON br.book_id = b.id INNER JOIN app_user AS au ON br.app_user_id = au.id WHERE br.is_published = 0 AND au.school = {school_id};")
        unpublished_ratings = cur.fetchall()
        cur.close()
        
        #Find rental requests
        cur = db.connection.cursor()
        cur.execute(f"SELECT br.id AS rental_id, u.username, b.title, br.request_datetime, br.rental_status FROM book_rental br JOIN app_user u ON u.id=br.app_user_id JOIN book b ON b.id=br.book_id WHERE u.school={school_id} AND br.is_active=0;")
        book_orders = cur.fetchall()
        cur.close()

        #Find late-to-return
        cur = db.connection.cursor()
        cur.execute(f"SELECT u.id, u.first_name, u.last_name, br.book_copy_id, DATEDIFF(NOW(), br.rental_datetime)-7 AS days_late FROM app_user u JOIN book_rental br ON u.id = br.app_user_id WHERE u.school = {school_id} AND br.late_to_return = 1;")
        late = cur.fetchall()
        cur.close()
        
        #Find inactive users
        cur = db.connection.cursor()
        cur.execute(f"SELECT * FROM app_user WHERE school = {school_id} AND is_active = 0;")
        inactive_users= cur.fetchall()
        cur.close()
        return render_template("librarian.html",user=current_user, school=school, users=inactive_users, book_orders=book_orders,
                               ratings=unpublished_ratings, role=session["user_role"], late=late)

@views.route("/set-active", methods=["POST"])
@login_required
def set_active():
    if current_user.get_id() == 1:
        return redirect(url_for("views.admin"))
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
    if current_user.get_id() == 1:
        return redirect(url_for("views.admin"))
    if session["user_role"] == "school_admin":
        rating_id = request.form.get("rating_id")
        cur = db.connection.cursor()
        cur.execute(f"UPDATE book_rating SET is_published = 1 WHERE id = {rating_id};")
        db.connection.commit()
        cur.close()
        flash("Rating submitted succesfully! It will be published when your school admin approves it.", category="success")

    return redirect(url_for("views.school_admin"))

@views.route("/profile", methods=["GET", "POST"])
@login_required
def profile():
    if current_user.get_id() == 1:
        return redirect(url_for("views.admin"))
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

@views.route("/admin", methods=["GET", "POST"])
@login_required
def admin():
    if current_user.get_id() != 1:
        return redirect(url_for('views.login'))
    if request.method == "POST":
        if "signup-school" in request.form:
            school_name = request.form.get("school_apellation")
            city = request.form.get("city")
            postcode = request.form.get("postcode")
            phone_number = request.form.get("phone_number")
            email = request.form.get("email")
            principal = request.form.get("principal")

            if not (school_name and city and postcode and phone_number and email and principal and first_name and last_name and birthdate and username and password1 and password2):
                flash("Please fill in all the fields.", category="error")
                return redirect(url_for('views.admin'))
            cur = db.connection.cursor()
            try:
                cur.execute("INSERT INTO school (appellation, city, postcode, phone_number, email, principal) VALUES (%s, %s, %s, %s, %s, %s)",
                    (school_name, city, postcode, phone_number, email, principal),)
                db.connection.commit()
                flash("School inserted succesfully.", category="success")
                cur.close()
            except db.connection.IntegrityError:
                db.connection.rollback()
                flash("Invalid inputs.", category="error")
                cur.close()
                return redirect(url_for('views.admin'))

            cur = db.connection.cursor()
            cur.execute(f"SELECT id from school WHERE appellation = '{school_name}'")
            school_id = cur.fetchone()
            cur.close()

            first_name = request.form.get("first_name")
            last_name = request.form.get("last_name")
            birthdate = request.form.get("birthdate")
            username = request.form.get("username")
            password1 = request.form.get("password1")
            password2 = request.form.get("password2")
            is_active = 1
            user_role = 'school_admin'


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
                cur = db.connection.cursor()
                cur.execute(
                    "INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) VALUES (%s, %s, %s, %s, %s, %s, %s, md5(%s))",
                    (first_name, last_name, birthdate, school_id, user_role, is_active, username, password1),
                )
                db.connection.commit()
                cur.close()

            flash("School and its librarian added succesfully.", category="success")
        
        elif "edit-info" in request.form:
            username = None
            school_id = request.form.get("school")
            new_username = request.form.get("username")
            new_name = request.form.get("name")
            new_lastname = request.form.get("lastname")
            new_bdate = request.form.get("birthdate")
            if school_id :
                cur = db.connection.cursor()
                cur.execute(f"SELECT * FROM app_user WHERE school = '{school_id}' AND user_role = 'school_admin';")
                user = cur.fetchone()
                cur.close()

                username = user[7]
            else:
                return redirect(url_for('views.admin'))

                    
            if new_name and new_lastname:
                cur = db.connection.cursor()
                cur.execute("UPDATE app_user SET first_name= %s, last_name= %s WHERE username= %s;", (new_name, new_lastname, username))
                db.connection.commit()
                cur.close()
                flash("Name and Lastname updated succesfully.", category="success")

            if new_bdate:
                date_object = datetime.strptime(new_bdate, "%Y-%m-%d")
                current_year = date.today().year

                if current_year - date_object.year < 18:
                    flash("Librarian cant be less than 18 years old.", category="error")
                    return redirect(url_for('views.admin'))
                else:  
                    cur = db.connection.cursor()
                    cur.execute("UPDATE app_user SET birthdate= %s WHERE username= %s;", (new_bdate, username))
                    db.connection.commit()
                    cur.close()
                    flash("Birthdate updated succesfully.", category="success")
            
            if new_username:
                cur = db.connection.cursor()
                cur.execute("SELECT username FROM app_user;")
                result=cur.fetchall()
                cur.close()
                users=list(result)

                if len(new_username) < 4:
                    flash("Username must be greater than 3 character.", category="error")
                    return redirect(url_for('views.admin'))
                elif new_username in users:
                    flash("Username already exists.", category="error")
                    return redirect(url_for('views.admin'))
                else:
                    cur = db.connection.cursor()
                    cur.execute("UPDATE app_user SET username= %s WHERE username= %s;", (new_username, username))
                    db.connection.commit()
                    cur.close()
                    flash("Username updated succesfully.", category="success")    
            
            return redirect(url_for('views.admin'))
    else:
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM school;")
        schools = cur.fetchall()
        cur.close()

        cur = db.connection.cursor()
        cur.execute(f"SELECT au.first_name, au.last_name, s.appellation FROM app_user as au INNER JOIN school as s ON au.school = s.id WHERE au.user_role = 'school_admin';")
        librarians = cur.fetchall()
        cur.close()

        return render_template("admin.html", schools = schools, librarians=librarians)
    
@views.route("/manage-books", methods=["GET", "POST"])
@login_required
def manage_books():
    if current_user.get_id() == 1:
        return redirect(url_for("views.admin"))
    if session["user_role"] != "school_admin":
        return redirect(url_for("views.home"))
    
    school_id = session["school_id"]
    user_id = current_user.get_id()  

    if request.method == "POST":
        
        if "add-book-copy" in request.form:
            book_id = request.form.get("book_id")
            cur = db.connection.cursor()
            cur.execute(f"INSERT INTO book_copies_per_school (book_id, school_id) VALUES ('{book_id}', '{school_id}');")
            db.connection.commit()
            cur.close()
            flash(f"Book added succesfully. Id = {book_id}", category="success")
        elif "remove-book-copy" in request.form:
            book_id = request.form.get("book_id")
            cur = db.connection.cursor()
            cur.execute(f"SELECT * FROM book_copies_per_school WHERE book_id='{book_id}' AND school_id='{school_id}' AND availability = 1")
            result = cur.fetchone()
            cur.close()
            if result:
                cur = db.connection.cursor()
                cur.execute(f"DELETE FROM book_copies_per_school WHERE id = {result[0]}")
                db.connection.commit()
                cur.close()
                flash(f"Book removed succesfully. Id = {book_id}", category="success")
            else:
                flash(f"Not available book copy to delete.", category="error")
        elif "add-new-book" in request.form:
            book_id = request.form.get("new_book_id")
            cur = db.connection.cursor()
            cur.execute(f"INSERT INTO book_copies_per_school (book_id, school_id) VALUES ('{book_id}', '{school_id}');")
            db.connection.commit()
            cur.close()
            flash(f"New book added succesfully Id = {book_id}", category="success")
        elif "insert-book" in request.form:
            writer_input = request.form.get("writer_input")
            title = request.form.get("title")
            publisher = request.form.get("publisher")
            isbn = request.form.get("isbn")
            number_of_pages = request.form.get("number_of_pages")
            abstract = request.form.get("abstract")
            lang = request.form.get("lang")
            keywords = request.form.get("keywords")

            image = request.form.get("image")
            categories = request.form.get("categories")

            try:
                cur = db.connection.cursor()
                book_insertion = f"INSERT INTO book (title, publisher, isbn, number_of_pages, category, abstract, image, keywords, lang) VALUES ('{title}', '{publisher}', '{isbn}', '{number_of_pages}', '{categories}', '{abstract}', '{image}','{keywords}', '{lang}');"
                cur.execute(book_insertion)
                db.connection.commit()
                cur.close()

                cur = db.connection.cursor()
                get_book_id = f"SELECT id from book WHERE title='{title};'"
                cur.execute(get_book_id)
                book_id = cur.fetchone()
                cur.close()
                
                image_id = book_id-1
                #save image in static/images/{image_id}.png and in ./images/{image_id}.png #
                """ here """

            except db.connection.IntegrityError:
                db.connection.rollback()
                cur.close()
                flash("Invalid inputs.", category="error")
                return redirect(url_for('views.manage_books'))

            if ',' in writer_input:
                writers_mini_list = writer_input.split(',')
            else:
                writers_mini_list = []
                writers_mini_list.append(writer_input)

            for writer in writers_mini_list:
                first_name = writer.strip().split(' ')[1:]
                last_name = writer.strip().split(' ')[0]

                #search if writer exists, if not insert it in the database
                cur = db.connection.cursor()
                search_writer = f"SELECT first_name, last_name from writer where first_name = '{first_name}' and last_name = '{last_name}';"
                cur.execute(search_writer)
                result = cur.fetchone()
                cur.close()
                if not result:
                    cur = db.connection.cursor()
                    writer_insertion_query = f"INSERT INTO writer (first_name, last_name) VALUES ('{first_name}', '{last_name}');"
                    cur.execute(writer_insertion_query)
                    db.connection.commit()
                    cur.close()
                
                #get writer id
                cur = db.connection.cursor()
                id_writer_query = f"SELECT id FROM writer where first_name = '{first_name}' and last_name = '{last_name}';"
                cur.execute(id_writer_query)
                writer_id = cur.fetchone()
                cur.close()

                #insert book_writer
                cur = db.connection.cursor()
                query = f"INSERT INTO book_writer (book_id, writer_id) VALUES ('{book_id}', '{writer_id}');"
                cur.execute(query)
                db.connection.commit()
                cur.close()

            #insert a book copy in the school library
            """ here """

            flash("Book inserted succesfully.", category="success")
            return redirect(url_for("views.manage_books"))  
      
    query=f"""SELECT b.title, COUNT(bcps.id) AS copy_count, b.image, b.id FROM app_user AS au JOIN school AS s ON au.school = s.id JOIN book_copies_per_school AS bcps ON s.id = bcps.school_id JOIN book AS b ON bcps.book_id = b.id WHERE au.id = {user_id} GROUP BY b.title ORDER BY copy_count DESC"""
    cur = db.connection.cursor()
    cur.execute(query)
    infos = cur.fetchall()
    cur.close()

    image_url=[]
    ids=[]
               
    for index, info in enumerate(infos):
        ids.append(info[3]-1)        
        image_url.append(url_for('static', filename=f'images/{ids[index]}.png'))
    
    cur = db.connection.cursor()
    cur.execute(f"SELECT book.title, book.id FROM book WHERE id NOT IN ( SELECT book_id FROM book_copies_per_school WHERE school_id = {school_id});")
    new_books = cur.fetchall()
    cur.close()

    new_book_image_url=[]
    new_book_ids=[]
    for index, book in enumerate(new_books):
        new_book_ids.append(book[1]-1)        
        new_book_image_url.append(url_for('static', filename=f'images/{new_book_ids[index]}.png'))

    return render_template("manage-books.html", user=current_user, infos=infos, image_url=image_url, new_books=new_books, new_book_image_url=new_book_image_url, role=session["user_role"])