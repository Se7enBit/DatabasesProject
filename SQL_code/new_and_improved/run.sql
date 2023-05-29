GRANT FILE ON *.* TO 'root'@'localhost';
SET NAMES utf8mb4;
source ./Database/School_Library_Database.sql;
source ./Database/app_user_triggers.sql;
source ./Database/book_rental_triggers.sql;
source ./Database/data_insertions.sql;
source ./Database/book_copies_insertions.sql;
source ./Database/book_rental_insertions.sql;
source ./Database/rating_insertions.sql;
\! python ../scrapper/scripts/image_update.py
source ./Database/image_update.sql;
source ./Database/password_update.sql;
source ./Database/on_delete_triggers.sql;
