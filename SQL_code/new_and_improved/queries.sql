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

-- Search book info by writer
SELECT b.title, COUNT(bcps.id) AS copy_count, b.image, b.id 
FROM app_user AS au 
JOIN school AS s ON au.school = s.id 
JOIN book_copies_per_school AS bcps ON s.id = bcps.school_id 
JOIN book AS b ON bcps.book_id = b.id 
JOIN book_writer bw ON bw.book_id = b.id
JOIN writer w ON bw.writer_id=w.id
WHERE au.id = {user_id}
AND w.first_name LIKE "%ONOMA%"
OR w.last_name LIKE "%EPONIMO%"
GROUP BY b.title

-- Select all inactive rentals in given school
SELECT br.id AS rental_id, u.username, b.title, br.request_datetime
FROM book_rental br
JOIN app_user u ON u.id=br.app_user_id
JOIN book b ON b.id=br.book_id
WHERE u.school=1
AND br.is_active=0;

--3.1.2 (first part)
SELECT writer.* FROM writer JOIN book_writer
    -> ON writer.id = book_writer.writer_id
    -> JOIN book ON book.id = book_writer.book_id
    -> WHERE book.category = "art";

--3.1.4 Writers whose books have never been rented
SELECT w.*
FROM writer w
WHERE NOT EXISTS (
  SELECT 1
  FROM book_writer bw
  JOIN book_rental br ON bw.book_id = br.book_id
  WHERE bw.writer_id = w.id
);

--3.1.6 Top 3 books with pair of categories
SELECT b.id, b.title, b.category, COUNT(br.id) AS book_rentals
FROM book b
LEFT JOIN book_rental br ON b.id = br.book_id
WHERE FIND_IN_SET('art', b.category) > 0
    AND FIND_IN_SET('autobiography', b.category) > 0
GROUP BY b.id
ORDER BY book_rentals DESC
LIMIT 3;

--3.2.2 Users that have at least one late-to-return book
SELECT u.id, u.first_name, u.last_name, br.book_copy_id, DATEDIFF(NOW(), br.rental_datetime)-7 AS days_late
FROM app_user u
JOIN book_rental br ON u.id = br.app_user_id
WHERE u.school = 1
AND br.late_to_return = 1;


--3.2.3 by user
SELECT AVG(rating) FROM book_rating JOIN app_user
    ON book_rating.app_user_id = app_user.id
    WHERE app_user.id=10;

--3.2.3 by category
SELECT AVG(book_rating.rating) FROM book_rating JOIN book 
    ON book_rating.book_id = book.id
    WHERE book.category = "art";

--3.1.7 (draft)
SELECT writer.first_name, writer.last_name, COUNT(*) AS book_count
FROM book_writer JOIN writer ON book_writer.writer_id = writer.id
GROUP BY book_writer.writer_id 
HAVING book_count < (SELECT MAX(book_count) 
                    FROM (SELECT COUNT(*) AS book_count 
                            FROM book_writer 
                            GROUP BY writer_id) AS subquery)-5 
ORDER BY book_count DESC;



-------------------VVV PLAYING AREA VVV--------------------
SELECT br.id AS rental_id, u.username, b.title, br.request_datetime
FROM book_rental br
JOIN app_user u ON u.id=br.app_user_id
JOIN book b ON b.id=br.book_id
WHERE u.school=1
AND br.rental_status='rented'
AND br.is_active=1;