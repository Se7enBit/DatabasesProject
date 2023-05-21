#!/usr/bin/env python3

import rental_package.book_renter
import mysql.connector

mydb = mysql.connector.connect( host = 'localhost',
                                user = 'root',
                                database = 'school_library'
                               )

mycursor = mydb.cursor(buffered = True)

rental_package.book_renter.set_late_to_return_rental_status_scheduled(mycursor, mydb)
rental_package.book_renter.set_system_cancelled_rental_status_scheduled(mycursor, mydb)
