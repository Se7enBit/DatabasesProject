from flask import Blueprint, render_template, request, flash, jsonify, url_for, session
from flask_login import login_required, current_user
from . import db

queries = Blueprint("queries", __name__)

@queries.route("/run-query", methods=["POST"])
@login_required
def run_query():
    if request.method == "POST":
        if "query1.1" in request.form:
            cur = db.connection.cursor()
            cur.execute("SELECT school.appellation, COUNT(*) AS rented_books_count FROM book_rental JOIN book_copies_per_school ON book_rental.book_copy_id = book_copies_per_school.id JOIN school ON book_copies_per_school.school_id = school.id WHERE book_rental.rental_status = 'rented' GROUP BY school.appellation;")
            rents_per_school = cur.fetchall()
            cur.close()
    
    return render_template("queries.html", query1_1=rents_per_school, user=current_user)