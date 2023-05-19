from flask import Blueprint, render_template, request, flash, jsonify, url_for, session
from flask_login import login_required, current_user
from . import db

queries = Blueprint("queries", __name__)

@queries.route("/run-query", methods=["POST"])
@login_required
def run_query():
  query1 = None
  query2 = None

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
      cur = db.connection.cursor()
      cur.execute("SELECT * from school")
      query2= cur.fetchall()
      cur.close()

    return render_template("queries.html", query1_1=query1, query1_2=query2, user=current_user)