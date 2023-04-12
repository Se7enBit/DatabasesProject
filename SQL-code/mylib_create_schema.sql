USE student_library;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

CREATE TABLE School(
    id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(80) NOT NULL,
    postcode VARCHAR(10),
    city VARCHAR(20),
    phoneNumber VARCHAR(10),
    email VARCHAR(20),
    principal VARCHAR(80),
    PRIMARY KEY(id)
);

CREATE TABLE Users( 
    id INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    birthdate DATE, 
    school INT,
    role ENUM ('student', 'teacher', 'libraryAdmin') NOT NULL,
    username VARCHAR(20),
    password VARCHAR(20),
    isActive BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY(id),
    FOREIGN KEY(school) REFERENCES School(id)
);

CREATE TABLE Book(
    id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(80) NOT NULL,
    publisher VARCHAR(10),
    isbn VARCHAR(20),
    numberOfPages INT,
    abstract TEXT,
    image BLOB, 
    language ENUM ('Ελληνικά', 'Αγγλικά', 'Γαλλικά', 'Γερμανικά', 'Ξένα') DEFAULT NULL,
    keyWords TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE BookCopiesPerSchool(
    id INT AUTO_INCREMENT NOT NULL,
    bookid INT,
    schoolid INT,
    PRIMARY KEY(id),
    FOREIGN KEY(bookid) REFERENCES Book(id),
    FOREIGN KEY(schoolid) REFERENCES School(id)
);

CREATE TABLE BookCategory(
    bookid INT,
    category ENUM("περιπέτεια", "θρίλλερ"),
    PRIMARY KEY(bookid, category),
    FOREIGN KEY(bookid) REFERENCES Book(id)
);

CREATE TABLE BookKeywords(
    bookid INT,
    keyword VARCHAR(15),
    PRIMARY KEY(bookid, keyword),
    FOREIGN KEY(bookid) REFERENCES Book(id)
);

CREATE TABLE BookWriter(
    bookid INT,
    writerid INT,
    firstName VARCHAR(20),
    lastName VARCHAR(20),
    PRIMARY KEY(bookid, writerid),
    FOREIGN KEY(bookid) REFERENCES Book(id)
);

CREATE TABLE BookRating(
    userid INT,
    bookid INT,
    ratingDateTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    comments TEXT NOT NULL,
    rating ENUM ('Πολύ κακό', 'Κακό', 'Αδιάφορο', 'Καλό', 'Πολύ καλό'),
    isPublished BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY(userid, bookid),
    FOREIGN KEY(userid) REFERENCES Users(id),
    FOREIGN KEY(bookid) REFERENCES Book(id)
);

CREATE TABLE BookRental(
    id INT AUTO_INCREMENT NOT NULL,
    userid INT,
    bookCopyid INT,
    requestDateTime DATETIME,
    rentalDateTime DATETIME,
    returnDateTime DATETIME,
    status ENUM('rented', 'returned', 'late to return', 'on hold', 'cancelled') NOT NULL,
    priority INT,
    lateReturn BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY(id),
    FOREIGN KEY(userid) REFERENCES Users(id),
    FOREIGN KEY(bookCopyid) REFERENCES BookCopiesPerSchool(id)
);

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
