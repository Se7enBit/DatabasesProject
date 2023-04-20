CREATE DATABASE school_library;
USE school_library;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

CREATE TABLE school(
    id INT AUTO_INCREMENT PRIMARY KEY,
    appellation VARCHAR(80) UNIQUE NOT NULL,
    postcode VARCHAR(10),
    city VARCHAR(40),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    principal VARCHAR(80)
    CONSTRAINT check_postcode CHECK (postcode REGEXP '^(\d{3} ?\d{2}|NULL)$'),
    CONSTRAINT check_phone_number CHECK (phone_number REGEXP '^((+\d{1,3})? ?\d{10}|NULL)$'),
    CONSTRAINT check_email CHECK (email REGEXP '^([A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}|NULL)$')
);

CREATE TABLE app_user( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    birthdate DATE, 
    school INT,
    user_role ENUM ('student', 'teacher', 'school_admin', 'general_admin') NOT NULL,
    username VARCHAR(30) UNIQUE,
    user_password VARCHAR(255),
    is_active BOOLEAN DEFAULT 0,
    FOREIGN KEY(school) REFERENCES school(id) ON DELETE CASCADE,
    CONSTRAINT check_birthdate CHECK (birthdate < CURDATE())
);

CREATE TABLE Book(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publisher VARCHAR(180),
    isbn VARCHAR(20) UNIQUE,
    number_of_pages INT,
    category SET ('adventure', 'art', 'autobiography', 'biography', 'children’s', 'classic', 'comedy',
                'comic', 'contemporary', 'crime', 'drama', 'education', 'engineering', 'fantasy', 'Greek literature',
                'health', 'history', 'literature', 'math', 'mystery', 'poetry', 'romance', 'science', 'science fiction',
                'sociology', 'technology', 'thriller', 'travel') NOT NULL, 
    abstract TEXT,
    image BLOB, 
    lang ENUM ('Ελληνικά', 'Αγγλικά', 'Γαλλικά', 'Γερμανικά', 'Ξένα') DEFAULT 'Ελληνικά',
    keywords TEXT,
    CONSTRAINT check_isbn CHECK (isbn REGEXP '^(?:ISBN(?:-1[03])?:? )?(?=[0-9X]{10}$|(?=(?:[0-9]+[- ]){3})[- 0-9X]{13}$|97[89][0-9]{10}$|(?=(?:[0-9]+[- ]){4})[- 0-9]{17}$)(?:97[89][- ]?)?[0-9]{1,5}[- ]?[0-9]+[- ]?[0-9]+[- ]?[0-9X]$'), 
    CONSTRAINT check_keywords CHECK (keywords REGEXP '^([a-zA-Z]+)(, ?[a-zA-Z]+)*$')
);

CREATE TABLE book_copies_per_school(
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    school_id INT NOT NULL,
    availabity_status ENUM ('Available', 'Engaged') DEFAULT 'Available',
    FOREIGN KEY(book_id) REFERENCES book(id) ON DELETE CASCADE,
    FOREIGN KEY(school_id) REFERENCES school(id) ON DELETE CASCADE
);

-- CREATE TABLE BookCategory(
--     bookid INT,
--     category ENUM("περιπέτεια", "θρίλλερ"),
--     PRIMARY KEY(bookid, category),
--     FOREIGN KEY(bookid) REFERENCES Book(id)
-- );

-- CREATE TABLE BookKeywords(
--     bookid INT,
--     keyword VARCHAR(15),
--     PRIMARY KEY(bookid, keyword),
--     FOREIGN KEY(bookid) REFERENCES Book(id)
-- );

CREATE TABLE writer(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL
);

CREATE TABLE book_writer(
    book_id INT NOT NULL,
    writer_id INT NOT NULL,
    PRIMARY KEY (book_id, writer_id),
    FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
    FOREIGN KEY (writer_id) REFERENCES writer(id) ON DELETE CASCADE
);

CREATE TABLE book_rating(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_id INT NOT NULL,
    ratingDateTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    comments TEXT,
    rating ENUM ('Πολύ κακό', 'Κακό', 'Αδιάφορο', 'Καλό', 'Πολύ καλό') NOT NULL,
    is_published BOOLEAN DEFAULT 0,
    FOREIGN KEY(user_id) REFERENCES app_user(id) ON DELETE SET NULL,
    FOREIGN KEY(book_id) REFERENCES book(id) ON DELETE CASCADE
);

CREATE TABLE book_rental(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    book_copy_id INT,
    book_id INT NOT NULL,
    request_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    rental_datetime DATETIME,
    return_datetime DATETIME,
    rental_status ENUM('rented', 'returned', 'late to return', 'on hold', 'cancelled') NOT NULL,
    priority INT,
    late_return BOOLEAN DEFAULT 0,
    FOREIGN KEY(user_id) REFERENCES app_user(id) ON DELETE SET NULL,
    FOREIGN KEY(book_copy_id) REFERENCES book_copies_per_school(id) ON DELETE SET NULL,
    FOREIGN KEY(book_id) REFERENCES book(id) ON DELETE CASCADE,
    CONSTRAINT check_rental_datetime CHECK (rental_datetime >= request_datetime OR rental_datetime IS NULL),
    CONSTRAINT check_return_datetime CHECK (return_datetime >= rental_datetime OR return_datetime IS NULL),
    CONSTRAINT check_priority CHECK (priority >= 0) # OR priority IS NULL)
);

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
