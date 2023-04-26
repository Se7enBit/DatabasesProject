-- Search for writers per book
SELECT writer.*  FROM writer  INNER JOIN book_writer ON writer.id = book_writer.writer_id  WHERE book_writer.book_id = 12;

-- Search for books per writer
SELECT book.title FROM book JOIN book_writer ON book.id = book_writer.book_id where book_writer.writer_id = 13;
