from flask import Blueprint, render_template, request, flash, jsonify, url_for, redirect, session
from flask_login import login_required, current_user
from . import db
from SQL_code.rental_package import book_renter
queries = Blueprint("queries", __name__)

@queries.route("/run-query", methods=["POST"])
@login_required
def run_query():
  query1 = None
  query2 = None
  query2help = None
  category = None

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

    return render_template("queries.html", query1_1=query1, query1_2=query2, query1_2help=query2help, q2_category=category, categories=session["categories"], user=current_user, role=session["user_role"])
  
@queries.route("/rent-book", methods=["POST"])
@login_required
def rent_book():
  if request.method != "POST": return redirect(url_for("views.home"))
  print(session)
  app_user_id = session["_user_id"]
  requested_book_id = request.form.get("book_id")
  action = ""
  school = session["school_id"]

  cur = db.connection.cursor()
  #book_rental_runner(app_user_id, requested_book_id, action, school, mycursor, mydb)
  return redirect(url_for("views.home"))