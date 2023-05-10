DELIMITER $$

# Only ONE user in the table can be a 'general_admin'. ΦΟΒΑΜΑΙ ΟΤΙ ΑΥΤΟ ΔΕΝ ΘΑ ΕΙΝΑΙ ΑΠΟΔΟΤΙΚΟ... ΘΑ ΚΑΘΥΣΤΕΡΕΙ ΕΑΝ ΕΧΟΥΜΕ ΠΟΛΛΕΣ ΕΓΓΡΑΦΕΣ.
CREATE TRIGGER unique_general_admin
BEFORE INSERT ON app_user
FOR EACH ROW
BEGIN
  IF NEW.user_role = 'general_admin' AND 
    (SELECT COUNT(*) FROM app_user WHERE user_role = 'general_admin') > 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'There is already a general_admin into the database';
  END IF;
END$$

CREATE TRIGGER unique_general_admin2
BEFORE UPDATE ON app_user
FOR EACH ROW
BEGIN
  IF NEW.user_role = 'general_admin' AND 
    (SELECT COUNT(*) FROM app_user WHERE user_role = 'general_admin') > 0 AND OLD.user_role <> NEW.user_role THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'There is already a general_admin into the database';
  END IF;
END$$


# The 'general_admin' cannot be associated to a school.
CREATE TRIGGER general_admin_no_school
BEFORE INSERT ON app_user
FOR EACH ROW
BEGIN
  IF NEW.user_role = 'general_admin' AND 
    NEW.school IS NOT NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The general_admin cannot be associated to a school';
  END IF;
END$$

CREATE TRIGGER general_admin_no_school2
BEFORE UPDATE ON app_user
FOR EACH ROW
BEGIN
  IF NEW.user_role = 'general_admin' AND 
	NEW.school IS NOT NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The general_admin cannot be associated to a school';
  END IF;
END$$


# There can only be ONE 'school_admin' per school. 
CREATE TRIGGER unique_school_admin_per_school
BEFORE INSERT ON app_user
FOR EACH ROW
BEGIN
  IF NEW.user_role = 'school_admin' AND 
    (SELECT COUNT(*) FROM app_user WHERE user_role = 'school_admin' AND school = NEW.school) > 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'There can only be one school_admin for every school inside the database.';
  END IF;
END$$

CREATE TRIGGER unique_school_admin_per_school2
BEFORE UPDATE ON app_user
FOR EACH ROW
BEGIN
  IF NEW.user_role = 'school_admin' AND 
    (SELECT COUNT(*) FROM app_user WHERE user_role = 'school_admin' AND school = NEW.school) > 0  AND NEW.user_role <> OLD.user_role THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'There can only be one school_admin for every school inside the database.';
  END IF;
END$$

# On insert, in case the field is not filled by the user, the first value of the ENUM is going to be inserted (wrongly).
CREATE TRIGGER not_null_user_role
BEFORE INSERT ON app_user
FOR EACH ROW
BEGIN
  IF NEW.user_role IS NULL THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'The user must have a user role.';
  END IF;
END$$

# For school_admins, teachers and students, it is mandatory to have a school
CREATE TRIGGER not_null_user_school
BEFORE INSERT ON app_user
FOR EACH ROW
BEGIN
  IF NEW.school IS NULL AND NEW.user_role <> 'general_admin' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'It is mandatory to set the school that the user belongs to.';
  END IF;
END$$

CREATE TRIGGER not_null_user_school2
BEFORE UPDATE ON app_user
FOR EACH ROW
BEGIN
  IF NEW.school IS NULL AND NEW.user_role <> 'general_admin' THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'It is mandatory to set the school that the user belongs to.';
  END IF;
END$$

DELIMITER ;
