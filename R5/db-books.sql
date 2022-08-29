USE stu0756;
SELECT * FROM books;
SELECT * FROM books WHERE bookname LIKE '%Java%';
SELECT * FROM books WHERE price >= 2500 AND price <= 5000;
SELECT * FROM books WHERE publishyear != 2021;
SELECT * FROM books WHERE price <= 2500 AND writer = '柴田望洋';
SELECT * FROM books JOIN publishers on books.publishername = publishers.publishername WHERE publishers.publisherlocation LIKE '東京%' ORDER BY (books.publishyear) ASC;
SELECT COUNT(*) FROM books JOIN publishers on books.publishername = publishers.publishername WHERE publishers.publisherlocation LIKE '大阪%';
SELECT DISTINCT b1.writer FROM books AS b1 JOIN books AS b2 on b1.writer = b2.writer WHERE b1.publishername != b2.publishername;