DELIMITER $$

# book_rental
# Only students and teachers can rent books.
CREATE TRIGGER book_rental_user_check
BEFORE INSERT ON book_rental
FOR EACH ROW
BEGIN
  DECLARE user_role_var ENUM('general_admin', 'school_admin', 'teacher', 'student');
  SELECT user_role INTO user_role_var FROM app_user WHERE id = NEW.app_user_id;  
  IF user_role_var NOT IN ('student', 'teacher') THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Only students and teachers can rent books.';
  END IF;
END$$

# There must be an app_user_id on insert (not on update - users may be deleted from the database).
CREATE TRIGGER not_null_book_rental_user
BEFORE INSERT ON book_rental
FOR EACH ROW
BEGIN
  IF NEW.app_user_id IS NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The record must have an app_user_id.';
  END IF;
END$$



# On book rental insert, the rental_status can only be 'rented', 'reservation' or 'on hold'.
CREATE TRIGGER book_rental_status_check
BEFORE INSERT ON book_rental 
FOR EACH ROW
BEGIN
  IF (NEW.rental_status is NULL) OR (NEW.rental_status NOT IN ('rented', 'on hold', 'reservation')) THEN
	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The rental status can either be "rented", "reservation" or "on hold" on insert.';
  END IF;
END$$

# On book rental update, the rental_status can change as follows:
# rented --> returned
# rented --> late to return
# on hold --> cancelled
# on hold --> rented
# on hold --> reservation
# late to return --> returned
# reservation --> rented
# reservation --> cancelled
CREATE TRIGGER book_rental_status_check2
BEFORE UPDATE ON book_rental 
FOR EACH ROW
BEGIN
  IF NEW.rental_status <> OLD.rental_status THEN
	IF (OLD.rental_status = 'rented' AND NEW.rental_status NOT IN ('returned', 'late to return')) OR
    (OLD.rental_status = 'reservation' AND NEW.rental_status NOT IN ('rented', 'cancelled')) OR
    (OLD.rental_status = 'on hold' AND NEW.rental_status NOT IN ('rented', 'cancelled', 'reservation')) OR
    OLD.rental_status = 'late to return' AND NEW.rental_status <> 'returned' OR
    OLD.rental_status = 'cancelled' AND NEW.rental_status <> 'cancelled' OR
    OLD.rental_status = 'returned' AND NEW.rental_status <> 'returned' THEN
		SIGNAL SQLSTATE '45000'
		  SET MESSAGE_TEXT = 'The rental status cannot change into this value';
    END IF;
  END IF;
END$$



# late_to_return_flag
CREATE TRIGGER book_rental_late_to_return_flag
BEFORE UPDATE ON book_rental 
FOR EACH ROW
BEGIN
  IF NEW.rental_status <> OLD.rental_status AND NEW.rental_status = 'late to return' THEN
	SET NEW.late_to_return = '1';
  END IF;
END$$



# rental_datetime_autocomplete
CREATE TRIGGER book_rental_datetime_autocomplete
BEFORE INSERT ON book_rental 
FOR EACH ROW
BEGIN
  IF NEW.rental_status = 'rented' THEN
	SET NEW.rental_datetime = CURRENT_TIMESTAMP;
  END IF;
END$$

CREATE TRIGGER book_rental_datetime_autocomplete2
BEFORE UPDATE ON book_rental 
FOR EACH ROW
BEGIN
  IF NEW.rental_status <> OLD.rental_status AND NEW.rental_status = 'rented' THEN
	SET NEW.rental_datetime = CURRENT_TIMESTAMP;
  END IF;
END$$



# return_datetime_autocomplete
CREATE TRIGGER book_return_datetime_autocomplete
BEFORE UPDATE ON book_rental
FOR EACH ROW
BEGIN
  IF NEW.rental_status <> OLD.rental_status AND NEW.rental_status = 'returned' THEN
	SET NEW.return_datetime = CURRENT_TIMESTAMP;
  END IF;
END$$



# cancel_datetime_autocomplete
CREATE TRIGGER book_cancel_datetime_autocomplete
BEFORE UPDATE ON book_rental
FOR EACH ROW
BEGIN
  IF NEW.rental_status <> OLD.rental_status AND NEW.rental_status = 'cancelled' THEN
	SET NEW.cancel_datetime = CURRENT_TIMESTAMP;
  END IF;
END$$



# reservation_datetime_autocomplete
CREATE TRIGGER book_reservation_datetime_autocomplete
BEFORE INSERT ON book_rental 
FOR EACH ROW
BEGIN
  IF NEW.rental_status = 'reservation' THEN
	SET NEW.reservation_datetime = CURRENT_TIMESTAMP;
  END IF;
END$$

CREATE TRIGGER book_reservation_datetime_autocomplete2
BEFORE UPDATE ON book_rental 
FOR EACH ROW
BEGIN
  IF NEW.rental_status <> OLD.rental_status AND NEW.rental_status = 'reservation' THEN
	SET NEW.reservation_datetime = CURRENT_TIMESTAMP;
  END IF;
END$$



# On book rental insert, if the rental_status is 'rented' or 'reservation' then book_copy_id cannot be NULL.
# if the rental_status is 'on hold', then book_copy_id must be NULL.
CREATE TRIGGER book_rental_book_copy_id
BEFORE INSERT ON book_rental
FOR EACH ROW
BEGIN
  IF (NEW.rental_status IN ('rented', 'reservation') AND NEW.book_copy_id IS NULL) OR (NEW.rental_status = 'on hold' AND NEW.book_copy_id IS NOT NULL) THEN
	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'book_rental_book_copy_id insert trigger';
  END IF;
END$$

# From 'on hold' to 'rented': book_copy_id --> NOT NULL
# From 'on hold' to 'reservation': book_copy_id --> NOT NULL
# From 'on hold' to 'cancelled': book_copy_id --> NULL
CREATE TRIGGER book_rental_book_copy_id2
BEFORE UPDATE ON book_rental
FOR EACH ROW
BEGIN
  IF (OLD.rental_status = 'on hold' and NEW.rental_status IN ('rented', 'reservation') and NEW.book_copy_id IS NULL) OR
  (OLD.rental_status = 'on hold' and NEW.rental_status = 'cancelled' and NEW.book_copy_id IS NOT NULL) THEN
	SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'book_rental_book_copy_id2 update trigger';
  END IF;
END$$

# On insert sets availability of book copy equals zero when a book copy is rented or reserved
CREATE TRIGGER set_book_copy_availability_zero
AFTER INSERT ON book_rental
FOR EACH ROW
BEGIN
    IF NEW.book_copy_id IS NOT NULL THEN
        UPDATE book_copies_per_school SET availability = 0 WHERE id = NEW.book_copy_id;
    END IF;
END$$ 

# On update sets availability of book copy equals zero when a book copy is rented or reserved
-- CREATE TRIGGER set_book_copy_availability_zero2
-- AFTER UPDATE ON book_rental
-- FOR EACH ROW
-- BEGIN
--     IF (OLD.book_copy_id <> NEW.book_copy_id AND NEW.book_copy_id IS NOT NULL) THEN
--         UPDATE book_copies_per_school
--         SET book_copies_per_school.availability = 0
--         WHERE book_copies_per_school.id = NEW.book_copy_id;
--     END IF;
-- END$$ 

CREATE TRIGGER set_book_copy_availability_zero2 
AFTER UPDATE ON book_rental
FOR EACH ROW
BEGIN
    IF (old.book_copy_id <> new.book_copy_id) AND (new.book_copy_id IS NOT NULL)
    THEN
        UPDATE book_copies_per_school
            SET availability = 0
        WHERE id = NEW.book_copy_id;
    END IF;
END$$

DELIMITER ;
