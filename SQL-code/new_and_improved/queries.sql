-- Search for writers per book
SELECT writer.*  FROM writer  INNER JOIN book_writer ON writer.id = book_writer.writer_id  WHERE book_writer.book_id = 12;

-- Search for books per writer
SELECT book.title FROM book JOIN book_writer ON book.id = book_writer.book_id where book_writer.writer_id = 13;

-- Search for all distinct writers that have
-- written books in a particular category
SELECT DISTINCT writer.* FROM writer JOIN book_writer ON book_writer.writer_id = writer.id JOIN book ON book_writer.book_id = book.id WHERE FIND_IN_SET('poetry', book.category) > 0;

-- Search for the writer who has written the 
-- most books
SELECT writer.*, COUNT(book_writer.book_id) AS NUM_books
       FROM writer
       INNER JOIN book_writer ON writer.id = book_writer.writer_id
       GROUP BY writer.id
       ORDER BY NUM_books DESC
       LIMIT 1;
