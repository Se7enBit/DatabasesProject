import mysql.connector
from datetime import datetime, timedelta

# # Connect to the database
# mydb = mysql.connector.connect( host = 'localhost',
#                                 user = 'root',
#                                 database = 'school_library'
#                                )

# If the user hasn't returned a book by due date
# (7 days after the rental_datetime)
# then the rental_status of the book_rental record must automatically change to 'late to return'
def set_late_to_return_rental_status(app_user, mycursor, mydb):
    # Get the user's book rentals where rental_status == 'rented'
    mycursor.execute(f'SELECT id, rental_datetime\
                       FROM book_rental\
                       WHERE app_user_id = {app_user} AND\
                       rental_status = "rented";')
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

# If the user is late to return a book rental
# then they cannot rent nor reserve a new book
def check_late_to_return_rentals(app_user, mycursor, mydb):
    # Update the late to return rentals
    set_late_to_return_rental_status(app_user, mycursor, mydb)
    # Get the user's late to return rentals
    mycursor.execute(f'SELECT book_rental.id, book.title, book_rental.rental_datetime\
                       FROM book_rental\
                       JOIN book\
                       ON book_rental.book_id = book.id\
                       WHERE book_rental.app_user_id = {app_user} AND\
                       book_rental.rental_status = "late to return";')
    late_to_return_rentals = mycursor.fetchall()
    # if late_to_return_rentals,
    # print out the late to return rentals, the amount of time for which they have been late and return False
    # else return True
    if late_to_return_rentals:
        print(f'The user with id {app_user} cannot rent nor reserve a new book, because they haven\'t yet returned the following book(s):')
        for i in late_to_return_rentals:
            # i[0] --> The id of the late to return book rental
            # i[1] --> The title of the late to return book
            # i[2] --> The rental_datetime of the late to return book
            late_period = datetime.now() - (i[2] + timedelta(days=7))
            print(f'- {i[1]} --> late to return for {late_period}.')
        return False
    return True

# If the user already has an open book rental for the same book
# (open book rental == (rental_status == 'rented' or rental_status == 'on hold' or rental_status == 'reservation'))
# then they cannot rent nor reserve it again (until the open rental becomes 'returned' or 'cancelled')
def check_open_book_rentals(app_user, requested_book, mycursor):
    # Get the user's open rentals for the book
    mycursor.execute(f'SELECT id, rental_status\
                       FROM book_rental\
                       WHERE app_user_id = {app_user} AND\
                       book_id = {requested_book} AND\
                       (rental_status = "rented" OR\
                       rental_status = "on hold" OR\
                       rental_status = "reservation");')
    open_book_rentals = mycursor.fetchall()
    # if open_book_rentals return False
    # else return True
    if open_book_rentals:
        if len(open_book_rentals) > 1:
            print('Something went wrong. The user appears to have more than one open book rentals for the book.')
        else:
            rental_status = 'reservation' if open_book_rentals[0][1] == 'reservation' else 'rental'
            print(f'You already have an open {rental_status} for this book.\
                    Until the {rental_status} is closed, you cannot rent nor reserve the same book.')
        return False
    return True

# Calculate the priority/order in which a user has requested for an engaged book
# (engaged book == all copies of the book in the school have (availability == 0))
# Add to the waiting list
def set_book_rental_priority(school, requested_book, mycursor):
    # Get all on hold book rentals for the book in the school
    mycursor.execute(f'SELECT book_rental.priority\
                       FROM book_rental\
                       JOIN app_user\
                       ON book_rental.app_user_id = app_user.id\
                       WHERE book_rental.book_id = {requested_book} AND\
                       app_user.school = {school} AND\
                       priority IS NOT NULL;')
    waiting_list = mycursor.fetchall()
    # Calculate the priority for the new on hold book rental (maxpriority + 1) and return it
    waiting_list_new = [i[0] for i in waiting_list]
    if waiting_list_new:
        priority = max(waiting_list_new) + 1
    else:
        priority = 1
    return priority

# When a book copy becomes disengaged
# check whether there are users on hold for the book in the school
# and if so return the id of the book_rental record that should reserve the disengaged book_copy
# (== return the book_rental id that meets the criteria to be able to reserve a book
# and that has the highest priority in the waiting list)
def next_in_waiting_list(disengaged_book, school, mycursor, mydb):
    # Get the users in the school that have requested for the disengaged_book and are on hold
    # Sort them by priority (ascending order)
    mycursor.execute(f'SELECT book_rental.id, book_rental.app_user_id\
                       FROM book_rental\
                       JOIN app_user\
                       ON book_rental.app_user_id = app_user.id\
                       WHERE book_rental.book_id = {disengaged_book} AND\
                       app_user.school = {school} AND\
                       book_rental.rental_status = "on hold"\
                       ORDER BY book_rental.priority ASC;')
    waiting_list = mycursor.fetchall()
    # Find the user in the waiting list that meets the criteria to reserve the book and has the highest priority
    # and return them
    for i in waiting_list:
        if check_late_to_return_rentals(i[1], mycursor, mydb) and check_weeks_rentals(i[1], 'reservation', mycursor):
            return i[0]
    # Get the title of the disengaged book
    mycursor.execute(f'SELECT title\
                       FROM book\
                       WHERE id = {disengaged_book};')
    book_title = mycursor.fetchone()[0]
    # If no one on the waiting list meets the criteria
    if waiting_list:
        print(f'"{book_title}" could not be reserved by any user on the waiting list.')
    # If there is no waiting list for the disengaged book in the school
    else:
        print(f'There is no waiting list for the book "{book_title}".')

# On book_rental update
# from rental_status == 'on hold' to 'rented'
# or from rental_status == 'on hold' to 'reservation'
# or from rental_status == 'on hold' to 'cancelled'
# the priority of the record must turn 0 (++ when new_rental_status == 'rented' or 'reservation'
# a book_copy_id must be added to the record)
# and the priority of the remaining 'on hold' records for the same book at the same school must decrement by 1
def update_on_hold_book_rental(rental_id, new_rental_status, mycursor, mydb, book_copy_id = 'NULL'):
    # Get the school, the book_id, the priority and the initial rental_status from the book_rental record with id rental_id
    mycursor.execute(f'SELECT app_user.school, book_rental.book_id, book_rental.priority, book_rental.rental_status\
                       FROM book_rental\
                       JOIN app_user\
                       ON book_rental.app_user_id = app_user.id\
                       WHERE book_rental.id = {rental_id};')
    school, book_id, priority, old_rental_status = mycursor.fetchone()
    # This module only works for 'on hold' book_rental records that wish to update to 'rented', 'reservation' or 'cancelled'
    if new_rental_status not in ['rented', 'reservation', 'cancelled'] or old_rental_status != 'on hold':
        return 'This module only changes "on hold" rental status to "rented", "reservation" or "cancelled".'
    # Update the book rental record with id rental_id
    # Set its new rental_status
    # Set its priority to 0
    # If the new rental_status == 'rented' or 'reservation', than a book_copy_id should be added
    # If the new rental_status == 'cancelled',than for book_copy_id set NULL
    mycursor.execute(f'UPDATE book_rental\
                       SET rental_status = "{new_rental_status}", priority = 0, book_copy_id = {book_copy_id}\
                       WHERE id = {rental_id};')
    mydb.commit()
    # Get the remaining 'on hold' records for the same book at the same school
    mycursor.execute(f'SELECT id\
                       FROM book_rental\
                       WHERE rental_status = "on hold" AND\
                       book_id = {book_id} AND\
                       priority > {priority} AND\
                       app_user_id IN (SELECT id FROM app_user WHERE school = {school});')
    records_on_hold = mycursor.fetchall()
    # If there are more 'on hold' records in the book_rental table for the same book at the same school
    # then their priority should decrement by 1
    if records_on_hold:
        mycursor.execute(f'UPDATE book_rental\
                           SET priority = priority - 1\
                           WHERE id IN ({", ".join(str(i[0]) for i in records_on_hold)});')
        mydb.commit()

# A student can rent/ reserve up to two books per week
# whereas a teacher can rent/ reserve one book per week
def check_weeks_rentals(app_user, rental_status, mycursor):
    starting_date = datetime.now() - timedelta(days = 7)
    if rental_status == 'rented':
        query_date = 'rental_datetime'
        print_word = 'rentals'
    elif rental_status == 'on hold':
        query_date = 'request_datetime'
        print_word = 'on holds'
    elif rental_status == 'reservation':
        query_date = 'reservation_datetime'
        print_word = 'reservations'
    mycursor.execute(f'SELECT id\
                       FROM book_rental\
                       WHERE app_user_id = {app_user} AND\
                       rental_status = "{rental_status}" AND\
                       {query_date} >= "{starting_date}";')
    weeks_rentals = mycursor.fetchall()
    mycursor.execute(f'SELECT user_role\
                       FROM app_user\
                       WHERE id = {app_user};')
    user_role = mycursor.fetchone()
    if user_role[0] == 'student':
        max_book_number = 2
    elif user_role[0] == 'teacher':
        max_book_number = 1
    if len(weeks_rentals) == max_book_number:
        print(f'The user has already used all their ' + print_word + ' for the week')
        return False
    elif len(weeks_rentals) > max_book_number:
        print('Something went wrong. The user appears to have more then ' +\
               str(max_book_number) + ' ' + print_word + ' for this week.')
        return False
    else:
        return True

def set_system_cancelled_rental_status(app_user, mycursor, mydb):
    
    mycursor.execute(f'SELECT id, book_copy_id, reservation_datetime\
                       FROM book_rental\
                       WHERE app_user_id = {app_user} AND\
                       rental_status = "reservation";')
    
    book_reservations = mycursor.fetchall()
    
    late_to_be_rented = [i[0] for i in book_reservations if i[2] + timedelta(days=7) < datetime.now()]
    book_copies_indeces = [i[1] for i in book_reservations if i[2] + timedelta(days=7) < datetime.now()]
    
    if late_to_be_rented:
        mycursor.execute(f'UPDATE book_rental\
                           SET rental_status = "cancelled"\
                           WHERE id IN ({", ".join(str(i) for i in late_to_be_rented)});')
        
        mydb.commit()  
        mycursor.execute(f'UPDATE book_copies_per_school\
                            SET availability = 1\
                            WHERE id IN ({", ".join(str(i) for i in book_copies_indeces)});')
        mydb.commit()  

# rent - reserve a book
#simulates renting or reservation commits to the database
def rent_reserve_book(app_user_id, requested_book, rental_status, school, mycursor, mydb):

    #on success of all checks the user can rent or reserve
    if not check_late_to_return_rentals(app_user_id, mycursor, mydb):
        return False

    set_system_cancelled_rental_status(app_user_id, mycursor, mydb)

    rental_entries_query = f'SELECT id\
            FROM book_rental\
            WHERE book_id = {requested_book}\
            AND app_user_id = {app_user_id}\
            AND rental_status = "reservation";'

    mycursor.execute(rental_entries_query)
    rental_entries = mycursor.fetchone()

    if not check_weeks_rentals(app_user_id, rental_status, mycursor):
        return False

    if rental_entries and rental_status == 'rented':
        mycursor.execute(f'UPDATE book_rental SET rental_status = "rented" WHERE id = {rental_entries[0]};')
        print('Your requested has been updated to rented.')
        mydb.commit()
        return True

    if not check_open_book_rentals(app_user_id, requested_book, mycursor):
        return False

    #searches for available books
    available_book_copies_query = f'SELECT id\
            FROM book_copies_per_school\
            WHERE book_id = {requested_book}\
            AND availability = 1\
            AND school_id = {school};'

    mycursor.execute(available_book_copies_query)
    available_book_copy = mycursor.fetchone()

    #if a book is available the system will rent or reserve the book for the user
    if available_book_copy:
        mycursor.execute(f'INSERT INTO book_rental (book_id, app_user_id, book_copy_id, rental_status) VALUES ({requested_book}, {app_user_id}, {available_book_copy[0]}, "{rental_status}");')
        mycursor.execute(f'UPDATE book_copies_per_school SET availability = 0 WHERE id = {available_book_copy[0]};')
        print('Your commit was successful')
        mydb.commit()

        #otherwise the book will be placed on hold
    else:
        priority = set_book_rental_priority(school, requested_book, mycursor)
        mycursor.execute(f'INSERT INTO book_rental (book_id, app_user_id, rental_status, priority) VALUES ({requested_book}, {app_user_id}, "on hold", {priority});')
        print(f'You have been placed on hold with priority number {priority}.')
        mydb.commit()
    return True

def cancel_book(app_user_id, requested_book, rental_status, school, mycursor, mydb):

        set_late_to_return_rental_status(app_user_id, mycursor, mydb)

        set_system_cancelled_rental_status(app_user_id, mycursor, mydb)
        
        search_query = f'SELECT id, book_copy_id, rental_status\
                        FROM book_rental\
                        WHERE app_user_id = {app_user_id}\
                        AND book_id = {requested_book}\
                        AND rental_status\
                        IN ("on hold", "reservation");'
        mycursor.execute(search_query)
        results = mycursor.fetchall()
        
        if results:
            if results[0][2] == "on hold":
                print(results[0][1])
                update_on_hold_book_rental(results[0][0], rental_status, mycursor, mydb)

            elif results[0][2] == "reservation":
                if not next_in_waiting_list(requested_book, school, mycursor, mydb):
                    mycursor.execute(f'UPDATE book_copies_per_school SET availability = "1" WHERE id = {results[0][1]};')
                    mydb.commit()
                else:
                    next_user = next_in_waiting_list(requested_book, school, mycursor, mydb)
                    update_on_hold_book_rental(next_user, 'reservation', mycursor, mydb, results[0][1])
                    print('Placing next user in waiting list.')
                    
            mycursor.execute(f'UPDATE book_rental\
                       SET rental_status = "{rental_status}"\
                       WHERE id = {results[0][0]};')
            print('Your request has been cancelled.')

            mydb.commit()
            return True
        
        print('The entry you are trying to cancel is neither on hold on reserved.')
        return False

def return_book(app_user_id, requested_book, rental_status, school, mycursor, mydb):

    set_late_to_return_rental_status(app_user_id, mycursor, mydb)

    set_system_cancelled_rental_status(app_user_id, mycursor, mydb)

    search_query = f'SELECT id, book_copy_id\
            FROM book_rental\
            WHERE app_user_id = {app_user_id}\
            AND book_id = {requested_book}\
            AND rental_status\
            IN ("rented", "late to return");'
    mycursor.execute(search_query)
    results = mycursor.fetchall()

    if results:
        if not next_in_waiting_list(requested_book, school, mycursor, mydb):
            mycursor.execute(f'UPDATE book_copies_per_school SET availability = "1" WHERE id = {results[0][1]};')
            mydb.commit()
        else:
            next_user = next_in_waiting_list(requested_book, school, mycursor, mydb)
            update_on_hold_book_rental(next_user, 'reservation', mycursor, mydb, results[0][1])
            print('Placing next user in waiting list.')
        mycursor.execute(f'UPDATE book_rental SET rental_status = "{rental_status}" WHERE id = {results[0][0]};')
        mydb.commit()
        print('The book has been returned.')
        return True
    print('There was no entry for your request.')
    return False

def book_rental_runner(app_user_id, requested_book, action, school, mycursor, mydb):
    if action in ('rented', 'reservation'):
        return rent_reserve_book(app_user_id, requested_book, action, school, mycursor, mydb)

    elif action == 'returned':
        return return_book(app_user_id, requested_book, action, school, mycursor, mydb)

    elif action == 'cancelled':
        return cancel_book(app_user_id, requested_book, action, school, mycursor, mydb)


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
                    WHERE id = {record[0]};')

            mydb.commit()  


def main():
    print('Running')

if __name__ == "__main__":
    main()
