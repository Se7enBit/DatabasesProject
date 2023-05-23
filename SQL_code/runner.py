import rental_package.book_renter
import mysql.connector

mydb = mysql.connector.connect( host = 'localhost',
                                user = 'root',
                                database = 'school_library'
                               )

mycursor = mydb.cursor(buffered = True)

app_user_id = 9
requested_book_id = 112
action = "reservation"

mycursor.execute(f'SELECT school FROM app_user WHERE id = {app_user_id}')
school = mycursor.fetchone()[0]

#book_rental_runner(app_user_id, requested_book, action, school, mycursor)
rental_package.book_renter.book_rental_runner(app_user_id, requested_book_id, action, school, mycursor, mydb)


