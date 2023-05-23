from flask import Blueprint, render_template, request, flash, jsonify, url_for, redirect, session
from flask_login import login_required, current_user
from . import db
from SQL_code.rental_package import book_renter as br
import mysql.connector

queries = Blueprint("queries", __name__)

@queries.route("/run-query", methods=["POST"])
@login_required
def run_query():
  query1 = None
  query2 = None
  query2help = None
  category = None
  query3 = None
  query4 = None
  query2_1help = None

  if request.method == "POST":
    if "query1.1" in request.form:
      if "monthCheckbox" in request.form:
        month = request.form.get("month")
        year = month[:4]
        month_number = month[5:]
        query = """
            SELECT school.appellation, COUNT(*) AS rented_books_count
            FROM book_rental
            JOIN book_copies_per_school ON book_rental.book_copy_id = book_copies_per_school.id
            JOIN school ON book_copies_per_school.school_id = school.id
            WHERE book_rental.rental_status IN ('rented', 'returned', 'late to return') 
              AND YEAR(book_rental.rental_datetime) = %s
              AND MONTH(book_rental.rental_datetime) = %s
            GROUP BY school.appellation;
            """
        cur = db.connection.cursor()
        cur.execute(query, (year, month_number))
        query1 = cur.fetchall()
        cur.close()
      elif "yearCheckbox" in request.form:
        year = request.form.get("year")
        query = """
            SELECT school.appellation, COUNT(*) AS rented_books_count
            FROM book_rental
            JOIN book_copies_per_school ON book_rental.book_copy_id = book_copies_per_school.id
            JOIN school ON book_copies_per_school.school_id = school.id
            WHERE book_rental.rental_status IN ('rented', 'returned', 'late to return') 
              AND YEAR(book_rental.rental_datetime) = %s
            GROUP BY school.appellation;
            """
        cur = db.connection.cursor()
        cur.execute(query, (year,))
        query1 = cur.fetchall()
        cur.close()
      else:
        cur = db.connection.cursor()
        cur.execute("SELECT school.appellation, COUNT(*) AS rented_books_count FROM book_rental JOIN book_copies_per_school ON book_rental.book_copy_id = book_copies_per_school.id JOIN school ON book_copies_per_school.school_id = school.id WHERE book_rental.rental_status = 'rented' GROUP BY school.appellation;")
        query1 = cur.fetchall()
        cur.close()
                      
    if "query1.2" in request.form:
      category = request.form.get("category")

      cur = db.connection.cursor()
      cur.execute(f"SELECT DISTINCT w.first_name, w.last_name FROM writer as w JOIN book_writer as bw ON bw.writer_id = w.id JOIN book as b ON b.id = bw.book_id WHERE FIND_IN_SET('{category}', b.category) > 0;")
      query2= cur.fetchall()
      cur.close()

      cur = db.connection.cursor()
      cur.execute(f"SELECT DISTINCT au.first_name, au.last_name FROM app_user as au JOIN book_rental as br ON br.app_user_id = au.id JOIN book as b ON b.id = br.book_id WHERE au.user_role = 'teacher' AND b.category IN ('{category}') AND br.rental_datetime >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);")      
      query2help = cur.fetchall()
      cur.close()
    
    if "query1.3" in request.form:
      cur = db.connection.cursor()
      cur.execute("SELECT au.id, au.first_name, au.last_name, COUNT(*) AS rent_count FROM app_user AS au JOIN book_rental AS br ON au.id = br.app_user_id JOIN book ON br.book_id = book.id WHERE au.user_role = 'teacher' AND au.birthdate > DATE_SUB(NOW(), INTERVAL 40 YEAR) AND br.rental_status IN ('rented', 'returned') GROUP BY au.id, au.first_name, au.last_name ORDER BY rent_count DESC LIMIT 10;")
      query3= cur.fetchall()
      cur.close()

    if "query2.1" in request.form:
      query = None
      if ("titleCheckbox") in request.form:
        title = request.form.get("title")
        if title:
          query = f"SELECT writer.first_name, writer.last_name, book.* FROM book JOIN book_writer ON book.id = book_writer.book_id JOIN writer ON book_writer.writer_id = writer.id WHERE book.title LIKE '%{title}%';"
      elif ("categoryCheckbox") in request.form:
        category = request.form.get("category")
        if category:
          query = f"SELECT writer.first_name, writer.last_name, book.* FROM book JOIN book_writer ON book.id = book_writer.book_id JOIN writer ON book_writer.writer_id = writer.id WHERE FIND_IN_SET('{category}', category);"
      elif ("writerCheckbox") in request.form:
        writer = request.form.get("writer")
        if writer:
          query = f"SELECT writer.first_name, writer.last_name, book.* FROM book JOIN book_writer ON book.id = book_writer.book_id JOIN writer ON book_writer.writer_id = writer.id WHERE writer.last_name LIKE '%{writer}%' OR writer.first_name LIKE '%{writer}%';"
      elif ("copiesCheckbox") in request.form:
        copies = request.form.get("copies")
        if copies:
          query = f"SELECT writer.first_name, writer.last_name, book.* FROM book JOIN book_writer ON book.id = book_writer.book_id JOIN writer ON book_writer.writer_id = writer.id JOIN book_copies_per_school ON book.id = book_copies_per_school.book_id GROUP BY book.id HAVING COUNT(book_copies_per_school.id) = {copies};"


      if query:
        cur = db.connection.cursor()
        cur.execute(query)
        query4 = cur.fetchall()
        cur.close()
        query2_1help = []
        ids=[]            
        for index, book in enumerate(query4):
          ids.append(book[2]-1)         
          query2_1help.append(url_for('static', filename=f'images/{ids[index]}.png'))

    return render_template("queries.html", query1_1=query1, query1_2=query2, query1_2help=query2help, q2_category=category, query1_3= query3, categories=session["categories"], query2_1=query4,query2_1help=query2_1help, user=current_user, role=session["user_role"])
  
@queries.route("/rent-book", methods=["POST"])
@login_required
def rent_book():
  if request.method != "POST": return redirect(url_for("views.home"))
  avail = int(request.form.get("avail_books"))

  app_user_id = session["_user_id"]
  requested_book_id = request.form.get("book_id")
  if avail > 0: action = "rented" 
  else: action = "reservation"
  school = session["school_id"]

  mydb = mysql.connector.connect( host = 'localhost',
                                user = 'root',
                                database = 'school_library')
  mycursor = mydb.cursor(buffered = True)
  mycursor.execute(f'SELECT school FROM app_user WHERE id = {app_user_id}')

  print("Calling book_rental_runner")
  br.book_rental_runner(app_user_id, requested_book_id, action, school, mycursor, mydb)
  #flash("Your request has been submitted. Please wait for your library admin to accept it.", category="info")
  return redirect(url_for("views.home"))