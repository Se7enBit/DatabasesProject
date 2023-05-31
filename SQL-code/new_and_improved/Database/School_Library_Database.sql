CREATE DATABASE school_library;
USE school_library;
SET NAMES 'utf8';

# Create the οbjects of the Database.
CREATE TABLE school(
id INT AUTO_INCREMENT PRIMARY KEY,
appellation VARCHAR(80) UNIQUE NOT NULL,
city VARCHAR(40),
postcode VARCHAR(6),
phone_number VARCHAR(20),
email VARCHAR(255),
principal VARCHAR(80),
CONSTRAINT check_postcode CHECK (postcode REGEXP '^[0-9]{3} ?[0-9]{2}$'),
CONSTRAINT check_phone_number CHECK (phone_number REGEXP '^(\\+[0-9]{1,3})? ?[0-9]{10}$'),
CONSTRAINT check_email CHECK (email REGEXP '^[A-Za-z0-9._%\\+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$')
);

CREATE TABLE app_user(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(40) NOT NULL,
birthdate DATE, # YYYY-MM-DD
school INT,
user_role ENUM('general_admin', 'school_admin', 'teacher', 'student') NOT NULL,
is_active BOOLEAN DEFAULT 0,
username VARCHAR(30) UNIQUE,
userpassword VARCHAR(255),
FOREIGN KEY (school) REFERENCES school(id) ON DELETE CASCADE,
CONSTRAINT check_credentials CHECK ((username IS NULL AND userpassword IS NULL) OR (username IS NOT NULL AND userpassword IS NOT NULL))
);

CREATE INDEX index_app_user_id ON app_user (id);

CREATE TABLE book(
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
publisher VARCHAR(180),
isbn VARCHAR(30) UNIQUE,
number_of_pages INT,
category SET('adventure', 'art', 'autobiography', 'biography', 'children’s', 'classic', 'comedy', 'comic', 'contemporary', 'crime', 'drama', 'education', 'engineering', 'fantasy', 'finance', 'Greek literature', 'health', 'history', 'literature', 'management', 'math', 'mystery', 'poetry', 'psychology', 'romance', 'science', 'science fiction', 'sociology', 'technology', 'thriller', 'travel') NOT NULL, # You can list up to 64 values in a SET list. THE ORDER OF THE VALUES IS OF GREAT IMPORTANCE.
abstract TEXT,
lang ENUM('Greek', 'English', 'French', 'German') DEFAULT 'Greek',
image LONGBLOB,
keywords TEXT,
CONSTRAINT check_number_of_pages CHECK (number_of_pages > 0)
);

CREATE INDEX index_book_id ON book (id);

CREATE TABLE writer(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(40) NOT NULL
);

CREATE INDEX index_writer_id ON writer (id);

# The relationship between the book and the writer is m:n. So we need an additional table in between.
CREATE TABLE book_writer(
book_id INT NOT NULL,
writer_id INT NOT NULL,
PRIMARY KEY (book_id, writer_id),
FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
FOREIGN KEY (writer_id) REFERENCES writer(id) ON DELETE CASCADE
);

CREATE INDEX index_book_writer_id ON book_writer (writer_id);

CREATE TABLE book_copies_per_school(
id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT NOT NULL,
school_id INT NOT NULL,
availability BOOLEAN DEFAULT 1,
FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
FOREIGN KEY (school_id) REFERENCES school(id) ON DELETE CASCADE
);

CREATE INDEX index_book_copy_id ON book_copies_per_school (id);
CREATE INDEX index_book_copy_book_id ON book_copies_per_school (book_id);

CREATE TABLE book_rental(
id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT NOT NULL,
app_user_id INT,
book_copy_id INT,
request_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
rental_datetime DATETIME,
return_datetime DATETIME,
cancel_datetime DATETIME,
reservation_datetime DATETIME,
rental_status ENUM('rented', 'returned', 'reservation', 'late to return', 'on hold', 'cancelled') NOT NULL,
priority INT,
late_to_return BOOLEAN DEFAULT 0,
is_active BOOLEAN DEFAULT 0,
FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
FOREIGN KEY (app_user_id) REFERENCES app_user(id) ON DELETE SET NULL,
FOREIGN KEY (book_copy_id) REFERENCES book_copies_per_school(id) ON DELETE SET NULL,
CONSTRAINT check_priority CHECK (priority >= 0)
);

CREATE INDEX index_book_rental_id ON book_rental (id);
CREATE INDEX index_book_rental_book_id ON book_rental (book_id);
CREATE INDEX index_book_rental_app_user_id ON book_rental (app_user_id);

CREATE TABLE book_rating(
id INT AUTO_INCREMENT PRIMARY KEY,
book_id INT NOT NULL,
app_user_id INT,
rating ENUM('1', '2', '3', '4', '5') DEFAULT NULL,
comments TEXT,
rating_datetime DATETIME DEFAULT CURRENT_TIMESTAMP, 
is_published BOOLEAN DEFAULT 0,
FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
FOREIGN KEY (app_user_id) REFERENCES app_user(id) ON DELETE SET NULL
);
