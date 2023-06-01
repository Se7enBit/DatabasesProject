from flask import Blueprint, render_template, request, flash, jsonify, url_for, redirect, session
from flask_login import login_required, current_user
from . import db, app
from SQL_code.rental_package import book_renter as br
import mysql.connector, os, datetime

queries = Blueprint("queries", __name__) 

@queries.route("/run-query", methods=["POST"])
@login_required
def run_query():
  if session["user_role"] != "school_admin":
    return redirect(url_for("views.home"))
  query2_3 = None
  category = None
  query4 = None
  query2_1help = None

  if request.method == "POST":
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

    if "query2.3" in request.form:
      query=None
      criteria=None
      if ("userCheckbox") in request.form:
        user = request.form.get("user")
        criteria = next((usr[1] for usr in session["school_users"] if usr[0]==int(user)), None)
        if user:
          query = f"SELECT AVG(rating) FROM book_rating JOIN app_user ON book_rating.app_user_id = app_user.id WHERE app_user.id={user};"
      elif ("categoryCheckbox2") in request.form:
        category = request.form.get("category")
        criteria = category
        if category:
          query = f"""SELECT AVG(book_rating.rating) FROM book_rating JOIN book ON book_rating.book_id = book.id WHERE book.category = '{category}';"""
      
      if query:
        query2_3=['','']
        cur = db.connection.cursor()
        cur.execute(query)
        query2_3[0] = cur.fetchone()[0]
        if query2_3[0] == None: query2_3[0] = '-'
        query2_3[1] = criteria
        cur.close()

  return render_template("queries.html",categories=session["categories"],
                           query2_1=query4,query2_1help=query2_1help, query2_3=query2_3,
                           school_users=session["school_users"], user=current_user, role=session["user_role"])

@queries.route("/run-query-admin", methods=["POST"])
@login_required
def run_query_admin():
  query1 = None
  query2 = None
  query2help = None
  query1_4 = None
  query1_5 = None
  query1_6 = None
  query1_7 = None
  category = None
  query3 = None
  queryHelp = None

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
      cur.execute(f"SELECT DISTINCT au.first_name, au.last_name FROM app_user as au JOIN book_rental as br ON br.app_user_id = au.id JOIN book as b ON b.id = br.book_id WHERE au.user_role = 'teacher' AND FIND_IN_SET('{category}', b.category) > 0 AND br.rental_datetime >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);")      
      query2help = cur.fetchall()
      cur.close()
    
    if "query1.3" in request.form:
      cur = db.connection.cursor()
      cur.execute("SELECT au.id, au.first_name, au.last_name, COUNT(*) AS rent_count FROM app_user AS au JOIN book_rental AS br ON au.id = br.app_user_id JOIN book ON br.book_id = book.id WHERE au.user_role = 'teacher' AND au.birthdate > DATE_SUB(NOW(), INTERVAL 40 YEAR) AND br.rental_status IN ('rented', 'returned') GROUP BY au.id, au.first_name, au.last_name ORDER BY rent_count DESC LIMIT 10;")
      query3= cur.fetchall()
      cur.close()

    if "query1.4" in request.form:
      cur = db.connection.cursor()
      cur.execute("SELECT w.* FROM writer w WHERE NOT EXISTS ( SELECT 1 FROM book_writer bw JOIN book_rental br ON bw.book_id = br.book_id WHERE bw.writer_id = w.id );")
      query1_4= cur.fetchall()
      cur.close()      

    if "query1.5" in request.form:
      query = None
      year = request.form.get("year")
      if year == "": year = 0
      query = f"SELECT au.username AS school_admin_username, COUNT(*) AS book_count FROM school s JOIN app_user au ON au.school = s.id JOIN book_copies_per_school bcps ON bcps.school_id = s.id JOIN book_rental br ON br.book_copy_id = bcps.id WHERE br.rental_status IN ('rented', 'returned', 'late to return') AND YEAR(br.rental_datetime) = {year} AND au.user_role = 'school_admin' GROUP BY au.username HAVING COUNT(*) > 20; "
      cur = db.connection.cursor()
      cur.execute(query)
      rentals = cur.fetchall()
      cur.close()
      query1_5=rentals

      #Get pairs with equal number of rentals
      pairs = {}
      query1_5 = {}
      for username, num_rents in rentals:
        if num_rents in pairs:
          pairs[num_rents].append(username)
        else:
          pairs[num_rents] = [username]
      for num_rents in pairs:
        if len(pairs[num_rents])>1: query1_5[num_rents]=pairs[num_rents]
      if query1_5 == {}: 
        query1_5["so instead we give you the rentals of each School Admin"]=["No","pairs","found"]#query1_5["note that the number of rentals must be greater than 20"]=["No","pairs","found"]
        for username, num_rents in rentals:
          query1_5[num_rents] = [username]

    if "query1.6" in request.form:
      category1 = request.form.get("category1")
      category2 = request.form.get("category2")
      if category1 == category2:
        query1_6=None
      else:
        cur = db.connection.cursor()
        cur.execute(f"SELECT b.id, b.title, b.category, COUNT(br.id) AS book_rentals FROM book b LEFT JOIN book_rental br ON b.id = br.book_id WHERE FIND_IN_SET('{category1}', b.category) > 0 AND FIND_IN_SET('{category2}', b.category) > 0 GROUP BY b.id ORDER BY book_rentals DESC LIMIT 3;")
        query1_6 = cur.fetchall()
        cur.close()
        queryHelp=[len(query1_6)]
        for book in query1_6:
          queryHelp.append(url_for('static', filename=f"images/{book[0]-1}.png"))      
        print(query1_6)
        print(queryHelp)

    if "query1.7" in request.form:
      cur = db.connection.cursor()
      cur.execute("SELECT writer.first_name, writer.last_name, COUNT(*) AS book_count FROM book_writer JOIN writer ON book_writer.writer_id = writer.id GROUP BY book_writer.writer_id  HAVING book_count < (SELECT MAX(book_count)  FROM (SELECT COUNT(*) AS book_count  FROM book_writer  GROUP BY writer_id) AS subquery)-5  ORDER BY book_count DESC;")
      query1_7= cur.fetchall()
      cur.close()

  return render_template("queries_admin.html", query1_1=query1, query1_2=query2, query1_2help=query2help, 
                           q2_category=category, query1_3=query3, query1_4=query1_4, query1_5=query1_5,
                           query1_6=query1_6, query1_7=query1_7,categories=session["categories"],
                           queryHelp=queryHelp, user=current_user, role=session["user_role"])

@queries.route("/rent-book", methods=["POST"])
@login_required
def rent_book():
  if request.method != "POST": return redirect(url_for("views.home"))
  elif session["user_role"] not in ["student", "teacher"]:
    flash("You cant rent as admin.", category = "error")
    return redirect(url_for("views.home"))
  else:
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
  
@queries.route('/backup')
@login_required
def backup():
    if current_user.get_id() !=1 :
      return redirect(url_for('views.home'))
    
    # Backup file name
    timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
    backup_file = f'backup_{timestamp}.sql'
    # Backup folder path
    backup_folder = 'backup'
    # Create the backup folder if it doesn't exist
    if not os.path.exists(backup_folder):
        os.makedirs(backup_folder)
    backup_file_path = os.path.join(backup_folder, backup_file)
    # MySQL dump command
    mysqldump_cmd = f"mysqldump -h {app.config['MYSQL_HOST']} -u {app.config['MYSQL_USER']} {app.config['MYSQL_DB']} > {backup_file_path}"
    # Execute the mysqldump command
    os.system(mysqldump_cmd)
    flash(f"Backup created: {backup_file}", category="success")
    return redirect(url_for('views.admin'))

@queries.route('/restore')
@login_required
def restore():
    if current_user.get_id() != 1:
        return redirect(url_for('views.home'))

    # Backup folder path
    backup_folder = 'backup'

    # Get the list of backup files
    backup_files = []
    for filename in os.listdir(backup_folder):
        if filename.endswith('.sql'):
            backup_files.append(filename)

    return render_template('restore.html', backup_files=backup_files)

@queries.route('/restore/<backup_file>')
@login_required
def restore_backup(backup_file):
    if current_user.get_id() != 1:
        return redirect(url_for('views.home'))

    # Backup folder path
    backup_folder = 'backup'

    # Backup file path
    backup_path = os.path.join(backup_folder, backup_file)

    # MySQL restore command
    mysql_restore_cmd = f"mysql -h {app.config['MYSQL_HOST']} -u {app.config['MYSQL_USER']} {app.config['MYSQL_DB']} < {backup_path}"

    # Execute the MySQL restore command
    os.system(mysql_restore_cmd)

    flash(f"Database restored from backup: {backup_file}", category="success")
    return redirect(url_for('views.admin'))