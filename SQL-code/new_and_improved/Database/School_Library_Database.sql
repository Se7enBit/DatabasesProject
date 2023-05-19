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
    CONSTRAINT check_phone_number CHECK (
        phone_number REGEXP '^(\\+[0-9]{1,3})? ?[0-9]{10}$'
    ),
    CONSTRAINT check_email CHECK (
        email REGEXP '^[A-Za-z0-9._%\\+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$'
    )
);
CREATE TABLE app_user(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    birthdate DATE,
    # YYYY-MM-DD
    school INT,
    user_role ENUM(
        'general_admin',
        'school_admin',
        'teacher',
        'student'
    ) NOT NULL,
    is_active BOOLEAN DEFAULT 0,
    username VARCHAR(30) UNIQUE,
    userpassword VARCHAR(255),
    FOREIGN KEY (school) REFERENCES school(id) ON DELETE CASCADE,
    CONSTRAINT check_credentials CHECK (
        (
            username IS NULL
            AND userpassword IS NULL
        )
        OR (
            username IS NOT NULL
            AND userpassword IS NOT NULL
        )
    ) # ΤΑ ΔΥΟ ΕΠΟΜΕΝΑ CONSTRAINTS ΙΣΩΣ ΝΑ ΜΠΟΥΝ PYTHON.
    #CONSTRAINT check_username CHECK (username REGEXP '^[A-Za-z][A-Za-z0-9._-]{7,29}$'), # 8-30 characters in total, starts with A-Z or a-z and contains only A-Z, a-z, 0-9, '_', '-' and '.'.
    #CONSTRAINT check_userpassword CHECK (userpassword REGEXP '^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$') # Minimum eight characters, at least one upper case English letter, one lower case English letter, one number and one special character.
);
CREATE TABLE book(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publisher VARCHAR(180),
    isbn VARCHAR(30) UNIQUE,
    number_of_pages INT,
    category
    SET(
            'adventure',
            'art',
            'autobiography',
            'biography',
            'children’s',
            'classic',
            'comedy',
            'comic',
            'contemporary',
            'crime',
            'drama',
            'education',
            'engineering',
            'fantasy',
            'finance',
            'Greek literature',
            'health',
            'history',
            'literature',
            'management',
            'math',
            'mystery',
            'poetry',
            'psychology',
            'romance',
            'science',
            'science fiction',
            'sociology',
            'technology',
            'thriller',
            'travel'
        ) NOT NULL,
        # You can list up to 64 values in a SET list. THE ORDER OF THE VALUES IS OF GREAT IMPORTANCE.
        abstract TEXT,
        lang ENUM('Greek', 'English', 'French', 'German') DEFAULT 'Greek',
        image LONGBLOB,
        keywords TEXT,
        -- CONSTRAINT check_isbn CHECK (isbn REGEXP '^(?:ISBN(?:-1[03])?:? )?(?=[0-9X]{10}$|(?=(?:[0-9]+[- ]){3})[- 0-9X]{13}$|97[89][0-9]{10}$|(?=(?:[0-9]+[- ]){4})[- 0-9]{17}$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9X]$'), # ΘΕΛΕΙ ΚΑΙ CHECKSUM VALIDATION ΑΠΟ ΤΗΝ PYTHON.
        -- CONSTRAINT check_keywords CHECK (keywords REGEXP '^([a-zA-Z]+)(, ?[a-zA-Z]+)*$'),
        CONSTRAINT check_number_of_pages CHECK (number_of_pages > 0)
);
CREATE TABLE writer(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL
);
# The relationship between the book and the writer is m:n. So we need an additional table in between.
CREATE TABLE book_writer(
    book_id INT NOT NULL,
    writer_id INT NOT NULL,
    PRIMARY KEY (book_id, writer_id),
    FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
    FOREIGN KEY (writer_id) REFERENCES writer(id) ON DELETE CASCADE
);
CREATE TABLE book_copies_per_school(
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    school_id INT NOT NULL,
    availability BOOLEAN DEFAULT 1,
    FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
    FOREIGN KEY (school_id) REFERENCES school(id) ON DELETE CASCADE
);
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
    rental_status ENUM(
        'rented',
        'returned',
        'reservation',
        'late to return',
        'on hold',
        'cancelled'
    ) NOT NULL,
    priority INT,
    late_to_return BOOLEAN DEFAULT 0,
    FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
    FOREIGN KEY (app_user_id) REFERENCES app_user(id) ON DELETE
    SET NULL,
        FOREIGN KEY (book_copy_id) REFERENCES book_copies_per_school(id) ON DELETE
    SET NULL,
        CONSTRAINT check_priority CHECK (priority >= 0) #CONSTRAINT check_reservation_datetime CHECK ((reservation_datetime >= request_datetime AND reservation_datetime IS NOT NULL) OR reservation_datetime IS NULL),
        #CONSTRAINT check_rental_datetime CHECK ((rental_datetime >= request_datetime AND
        #										((rental_datetime > reservation_datetime AND reservation_datetime IS NOT NULL) OR reservation_datetime IS NULL) AND
        #                                         cancel_datetime IS NULL AND
        #                                         rental_datetime IS NOT NULL) OR rental_datetime IS NULL),
        #CONSTRAINT check_return_datetime CHECK ((return_datetime > rental_datetime AND
        #										 rental_datetime IS NOT NULL AND
        #                                         cancel_datetime IS NULL AND
        #                                         ((return_datetime > reservation_datetime AND reservation_datetime IS NOT NULL) OR reservation_datetime IS NULL) AND
        #                                         return_datetime IS NOT NULL) OR return_datetime IS NULL),
        #CONSTRAINT check_cancel_datetime CHECK ((cancel_datetime > request_datetime AND
        #										 return_datetime IS NULL AND
        #                                         rental_datetime IS NULL AND
        #                                         ((cancel_datetime > reservation_datetime AND reservation_datetime IS NOT NULL) OR reservation_datetime IS NULL) AND
        #                                         cancel_datetime IS NOT NULL) OR cancel_datetime IS NULL)
);
CREATE TABLE book_rating(
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    app_user_id INT,
    rating ENUM('1', '2', '3', '4', '5') DEFAULT NULL,
    comments TEXT,
    rating_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_published BOOLEAN DEFAULT 0,
    FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
    FOREIGN KEY (app_user_id) REFERENCES app_user(id) ON DELETE
    SET NULL
);
