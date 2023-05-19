GRANT FILE ON *.* TO 'root'@'localhost';

source ./Database/School_Library_Database.sql;
source ./Database/app_user_triggers.sql;
source ./Database/book_rental_triggers.sql;
source ./Database/data_insertions.sql;
source ./Database/book_copies_insertions.sql;
source ./Database/book_rental_insertions.sql;
source ./Database/rating_insertions.sql;
source ./Database/image_update.sql;
