# Insert scools.
INSERT INTO school (appellation, city, postcode, phone_number, email) VALUES ('Εκπαιδευτήρια Δούκα', 'Μαρούσι', '151 26', '2106186000', 'info@doukas.gr');
INSERT INTO school (appellation, city, postcode, phone_number, email) VALUES ('CGS: Εκπαιδευτήρια Κωστέα - Γείτονα', 'Παλλήνη', '153 51', '2106030411', 'info@cgs.gr');
INSERT INTO school (appellation, city, postcode, phone_number, email) VALUES ('Αρσάκειο Ψυχικού', 'Ψυχικό', '154 52', '2106755555', 'info@arsakeio.gr');
INSERT INTO school (appellation, city, postcode, phone_number) VALUES ('3ο ΓΕΛ Αγίας Παρασκευής', 'Αγία Παρασκευή', '15343', '2106016531');
INSERT INTO school (appellation, city, postcode, phone_number, email) VALUES ('1o ΓΕΛ Παπάγου', 'Παπάγου', '156 69', '2106514704', NULL);

# Insert app_users.
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) VALUES ('Κυριακή', 'Αυγερινού', '1995-01-18', '1', 'student', '1', 'Kyriaki_Avgerinou', 'tfutfu765fujh*(&');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active) VALUES ('Πέτρος', 'Αυγερινός', '1997-01-03', '1', 'student', '1');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role) VALUES ('Δανάη', 'Αυγερινού', '1992-12-12', '1', 'student');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active) VALUES ('Σοφία', 'Αυγερινού', '2020-01-02', '2', 'student', '0');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) VALUES ('Ευδοκία', 'Αυγερινού', '2020-01-02', '2', 'student', '1', 'eudokiaa7', 'tfutfu765fujh*(&');

INSERT INTO app_user (first_name, last_name, birthdate, user_role, is_active, username, userpassword) VALUES ('General Admin', 'General Admin', '1963-06-22', 'general_admin', '1', 'general.admin', 'general@dmin9');

INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) VALUES ('Δημήτρης', 'Μαραγκός', '1959-01-13', '1', 'teacher', '1', 'Dimitris_Maragkos', 'segwe&6gvj3');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active) VALUES ('Γιώργος', 'Στάμου', '1970-02-14', '1', 'teacher', '0');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role, is_active, username, userpassword) VALUES ('Δήμητρα', 'Μαραγκού', '1959-01-13', '2', 'teacher', '1', 'Dimitra_Maragkou', 'jhjgfgu%4');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role) VALUES ('Γεωργία', 'Στάμου', '1970-02-14', '2', 'teacher');

INSERT INTO app_user (first_name, last_name, birthdate, school, user_role) VALUES ('Εμμανουήλ', 'Αυγερινός', '1966-12-20', '1', 'principal');
INSERT INTO app_user (first_name, last_name, birthdate, school, user_role) VALUES ('Πέτρος', 'Αυγερινός', '1939-05-12', '2', 'principal');

INSERT INTO app_user (first_name, last_name, school, user_role, is_active, username, userpassword) VALUES ('School Admin', 'School Admin', '1', 'school_admin', '1', 'schadmin', 'bererhwr&*876G');
INSERT INTO app_user (first_name, last_name, school, user_role, is_active, username, userpassword) VALUES ('School Admin2', 'School Admin2', '2', 'school_admin', '1', 'schadmin2', 'rgseh7&*&^');

# Insert books.
INSERT INTO book (title, publisher, isbn, number_of_pages, category, abstract, lang, image, keywords)
VALUES ('Intelligent Investor: The Definitive Book on Value Investing', 'HarperCollins Publishers Inc', '9780060555665', '640', 'management',
'The classic bestseller by Benjamin Graham, "The Intelligent Investor" has taught and inspired hundreds of thousands of people worldwide.
Since its original publication in 1949, Benjamin Graham"s book has remained the most respected guide to investing, due to his timeless philosophy of "value investing",
which helps protect investors against the areas of possible substantial error and teaches them to develop long-term strategies with which they will be comfortable down the road.
Over the years, market developments have borne out the wisdom of Graham"s basic policies, and in today"s volatile market, "The Intelligent Investor" is the most important book you
will ever read on making the right decisions to protect your investments and make them a success. Featuring new chapter updates - which append every chapter of Graham"s book,
leaving his original text untouched - from noted financial journalist Jason Zweig, this HarperBusiness Essentials edition of the timeless classic offers readers an even clearer
understanding of Graham"s wisdom as it should be applied today.', 'English', 'C:\Users\kyria\OneDrive\Desktop\Εργασία Βάσεων Δεδομένων ΗΜΜΥ 2022-2023\images\lalala.jpg', 'management, finance, investor');

INSERT INTO book (title, publisher, isbn, number_of_pages, category, lang, keywords) VALUES ('Αυτισμός. Μια νέα εισαγωγή στην ψυχολογική θεωρία και σύγχρονες απόψεις', 'Gutenberg', '9789600124132', '316', 'education,health,sociology', 'Greek', 'autism');

# Insert writers.
INSERT INTO writer (first_name, last_name) VALUES('Benjamin', 'Graham');
INSERT INTO writer (first_name, last_name) VALUES('Jose', 'Puertas');
INSERT INTO writer (first_name, last_name) VALUES('Sue', 'Fletcher');
INSERT INTO writer (first_name, last_name) VALUES('Francesca', 'Happé');

INSERT INTO book_writer (book_id, writer_id) VALUES('1', '1');
INSERT INTO book_writer (book_id, writer_id) VALUES('1', '3');
INSERT INTO book_writer (book_id, writer_id) VALUES('5', '4');
INSERT INTO book_writer (book_id, writer_id) VALUES('5', '5');

# Insert book copies.
INSERT INTO book_copies_per_school (book_id, school_id, availability_status) VALUES('1', '2', 'available');
INSERT INTO book_copies_per_school (book_id, school_id, availability_status) VALUES('1', '2', 'engaged');
INSERT INTO book_copies_per_school (book_id, school_id) VALUES('1', '2');

#Insert book rentals.
INSERT INTO book_rental (book_id, app_user_id, book_copy_id, rental_datetime, return_datetime, rental_status, priority, late_to_return) VALUES ();
INSERT INTO book_rental (book_id, app_user_id, book_copy_id, rental_status) VALUES ('5', '2', '8', 'rented');
INSERT INTO book_rental (book_id, app_user_id, book_copy_id, rental_status) VALUES ('5', '2', '8', 'on hold');
INSERT INTO book_rental (book_id, app_user_id, book_copy_id) VALUES ('5', '2', '8');


SELECT * FROM book_rental;
UPDATE book_rental SET rental_status = NULL WHERE id = 2;
DELETE FROM book WHERE id = '4';



# Queries.
SELECT school.*
FROM app_user
INNER JOIN school ON app_user.school = school.id
WHERE app_user.id = 1;

SELECT writer.*
FROM book_writer
JOIN writer ON writer.id = book_writer.writer_id
WHERE book_writer.book_id = 1;

SELECT * FROM book_copies_per_school
WHERE book_id = '2';



SELECT * FROM school;
SELECT * FROM app_user;
SELECT * FROM book;
SELECT * FROM writer;
SELECT * FROM book_writer;
SELECT * FROM book_copies_per_school;
SELECT * FROM book_rental;
SELECT * FROM book_rating;



DROP DATABASE school_library;
DROP TABLE book_rental;
DROP TRIGGER book_rental_status_check2;



ALTER TABLE book_rental
DROP CONSTRAINT check_return_datetime;

ALTER TABLE book_rental
ADD CONSTRAINT check_return_datetime CHECK (return_datetime >= rental_datetime OR (return_datetime IS NULL AND rental_datetime IS NULL));
