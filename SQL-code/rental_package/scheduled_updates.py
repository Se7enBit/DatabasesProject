import mysql.connector
from book_renter import next_in_waiting_list, update_on_hold_book_rental
from datetime import datetime, timedelta

# If the user hasn't returned a book by due date
# (7 days after the rental_datetime)
# then the rental_status of the book_rental record must automatically change to 'late to return'
def set_late_to_return_rental_status_scheduled(mycursor, mydb):
    # Get the user's book rentals where rental_status == 'rented'
    mycursor.execute(f'SELECT id, rental_datetime\
                       FROM book_rental\
                       WHERE rental_status = "rented";')
    book_rentals = mycursor.fetchall()
    # i[0] --> The id of the book_rental
    # i[1] --> The rental_datetime of the book_rental
    # From the previous query, get the records that are late to return
    late_to_return_rentals = [i[0] for i in book_rentals if i[1] + timedelta(days=7) < datetime.now()]
    if late_to_return_rentals:
        # Update the late to return rentals to rental_status == 'late to return'
        mycursor.execute(f'UPDATE book_rental\
                           SET rental_status = "late to return"\
                           WHERE id IN ({", ".join(str(i) for i in late_to_return_rentals)});')
        mydb.commit()

def set_system_cancelled_rental_status_scheduled(mycursor, mydb):
    
    mycursor.execute(f'SELECT id, book_copy_id, reservation_datetime, book_id, app_user_id\
                       FROM book_rental\
                       WHERE rental_status = "reservation";')
    
    book_reservations = mycursor.fetchall()

    for record in book_reservations:
        if record[2] + timedelta(days = 7) < datetime.now():
            search_school_query = f'SELECT school\
                    FROM app_user WHERE id = {record[4]};'
            mycursor.execute(search_school_query)
            school = mycursor.fetchone()[0]
            if not next_in_waiting_list(record[3], school, mycursor, mydb):
                mycursor.execute(f'UPDATE book_copies_per_school SET availability = "1" WHERE id = {record[1]};')
                mydb.commit()
            else:
                next_user = next_in_waiting_list(record[3], school, mycursor, mydb)
                update_on_hold_book_rental(next_user, 'reservation', mycursor, mydb, record[1])
                print('Placing next user in waiting list.')
            mycursor.execute(f'UPDATE book_rental\
                               SET rental_status = "cancelled"\
                               WHERE id {record[0]};')
            
            mydb.commit()  
