DELIMITER $$

# There will be no deletion on the records of table book_rental
CREATE TRIGGER book_rental_deletion
BEFORE DELETE ON book_rental
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'There can not be a deletion on the records of table book_rental';
END $$

# There will be no deletion on the records of table book
CREATE TRIGGER book_deletion
BEFORE DELETE ON book
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'There can not be a deletion on the records of books';
END $$

# There will be no deletion on the records of table writer
CREATE TRIGGER writer_deletion
BEFORE DELETE ON writer
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'There can not be a deletion on the records of writer';
END $$

# There will be no deletion on the records of table app_user
# when there is an open book rental status
CREATE TRIGGER open_book_rental_user_deletion
BEFORE DELETE ON app_user
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM book_rental WHERE app_user_id = OLD.id AND rental_status NOT IN ('returned', 'cancelled')) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'There can not be a deletion on the records of user with open book rentals';
    END IF;
END $$

#There will be no deletion on the records of table book_copies_per_school
# when there is an engaged book copy
CREATE TRIGGER engaged_book_copy_deletion
BEFORE DELETE ON book_copies_per_school
FOR EACH ROW
BEGIN
    IF (OLD.availability = 0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'There can not be a deletion on the records of a book copy that is engaged';
    END IF;
END $$

DELIMITER ;
