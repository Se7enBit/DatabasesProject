-- Search for writers per book
SELECT writer.*
FROM writer
    INNER JOIN book_writer ON writer.id = book_writer.writer_id
WHERE book_writer.book_id = 12;
-- Search for books per writer
SELECT book.title
FROM book
    JOIN book_writer ON book.id = book_writer.book_id
where book_writer.writer_id = 13;
-- Search for all distinct writers that have
-- written books in a particular category
SELECT DISTINCT writer.*
FROM writer
    JOIN book_writer ON book_writer.writer_id = writer.id
    JOIN book ON book_writer.book_id = book.id
WHERE FIND_IN_SET('poetry', book.category) > 0;
-- Search for the writer who has written the 
-- most books
SELECT writer.*,
    COUNT(book_writer.book_id) AS NUM_books
FROM writer
    INNER JOIN book_writer ON writer.id = book_writer.writer_id
GROUP BY writer.id
ORDER BY NUM_books DESC
LIMIT 1;
-- Select all books that a user has rented
select book.*
from book
    join book_rental ON book.id = book_rental.book_id
where book_rental.app_user_id = 10
    and book_rental.rental_status in ("rented", "late to return", "returned");
-- Select all books in a specific category
SELECT title
FROM book
WHERE FIND_IN_SET('drama', category);
-- Select all books with similar titles to the prompt
SELECT *
FROM book
WHERE title LIKE "%ΥΠΟΛΟΓΙΣΤΙΚΗ%";
-- Select all users in possession of a book that is late to return
SELECT app_user.first_name,
    app_user.last_name,
    book_rental.rental_datetime
FROM app_user
    JOIN book_rental ON book_rental.app_user_id = app_user.id
WHERE book_rental.rental_status = "late to return";

--3.1.2 (first part)
SELECT writer.* FROM writer JOIN book_writer
    -> ON writer.id = book_writer.writer_id
    -> JOIN book ON book.id = book_writer.book_id
    -> WHERE book.category = "art";

--3.2.3 by user
SELECT AVG(rating) FROM book_rating JOIN app_user
    ON book_rating.app_user_id = app_user.id
    WHERE app_user.id=10;

--3.2.3 by category
SELECT AVG(book_rating.rating) FROM book_rating JOIN book 
    ON book_rating.book_id = book.id
    WHERE book.category = "art";
