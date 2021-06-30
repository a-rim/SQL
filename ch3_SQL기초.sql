/* 1 */
SELECT bookname, price
FROM Book;

/* 2 */
select bookid, bookname, publisher, price
from Book;

select *
from Book;

/* 3 */
SELECT	publisher
FROM	Book;
-- 중복 제거 안됨
SELECT	DISTINCT publisher
FROM	Book;

/* 4 */
SELECT	*
FROM	Book
WHERE	price < 20000;

/* 5 */
SELECT	*
FROM	Book
WHERE	price >= 10000 AND price <= 20000;

SELECT	*
FROM	Book
WHERE	price BETWEEN 10000 AND 20000;

/* 6 */
SELECT *
FROM Book
WHERE publisher IN ('굿스포츠','대한미디어');

SELECT *
FROM Book
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

/* 7 */
SELECT publisher
FROM Book
WHERE bookname = '축구의 역사';

SELECT bookname, publisher
FROM Book
WHERE bookname LIKE '축구의 역사';

/* 8 */
SELECT bookname, publisher
FROM Book
WHERE bookname LIKE '%축구%';

/* 9 */
SELECT *
FROM Book
WHERE bookname LIKE '_구%';

/* 10 */
SELECT *
FROM Book
WHERE bookname LIKE '%축구%' AND price >= 20000;

/* 11 */
SELECT *
FROM Book
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

/* 12 */
SELECT	*
FROM	Book
ORDER BY	bookname;

/* 13 */
SELECT	*
FROM	Book
ORDER BY	price, bookname;

/* 14 */
SELECT	*
FROM	Book
ORDER BY	price DESC, publisher;

/* 15 */
SELECT	SUM(saleprice) 	AS	총매출
FROM	Orders;

/* 16 */
SELECT	custid, SUM(saleprice)
FROM	Orders
WHERE	custid = 2;

/* 17 */
SELECT	SUM(saleprice), AVG(saleprice), MIN(saleprice), MAX(saleprice)
FROM	Orders;

/* 18 */
SELECT	COUNT(*)
FROM	Orders;

/* 19 */
SELECT	custid, COUNT(*) AS 도서수량, SUM(saleprice) AS 총액
FROM	Orders
GROUP BY	custid;

/* 20 */
SELECT	custid, COUNT(*) AS 도서수량
FROM	Orders
WHERE	saleprice >= 8000
GROUP BY 	custid
HAVING	COUNT(*) >= 2;

/* 21 */
SELECT	*
FROM	Customer, Orders
WHERE	Customer.custid = Orders.custid;

/* 22 */
SELECT	*
FROM	Customer, Orders
WHERE	Customer.custid = Orders.custid
ORDER BY	Customer.custid;

/* 23 */
SELECT	name, saleprice
FROM	Customer, Orders
WHERE	Customer.custid = Orders.custid
ORDER BY	name;

/* 24 */
SELECT	name, SUM(saleprice)
FROM	Customer, Orders
WHERE	Customer.custid = Orders.custid
GROUP BY	name
ORDER BY	name;

/* 25 */
SELECT	name, bookname
FROM	Customer, Orders, Book
WHERE	Customer.custid = Orders.custid AND Orders.bookid = Book.bookid;



/*  */
SELECT
FROM