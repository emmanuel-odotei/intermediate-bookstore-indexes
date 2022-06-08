SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

SELECT * FROM pg_indexes
WHERE tablename = 'customers';

SELECT * FROM pg_indexes
WHERE tablename = 'books';

SELECT * FROM pg_indexes
WHERE tablename = 'orders';

EXPLAIN ANALYZE SELECT customer_id, quantity FROM orders
WHERE quantity > 18;

CREATE INDEX customerid_quantity_idx ON orders(customer_id, quantity)
WHERE quantity > 18;

EXPLAIN ANALYZE SELECT customer_id, quantity FROM orders
WHERE quantity > 18;

ALTER TABLE customers
ADD CONSTRAINT customers_pkey
  PRIMARY KEY (customer_id);

EXPLAIN ANALYZE SELECT *
FROM customers
WHERE customer_id < 100;

CLUSTER customers USING customers_pkey;

SELECT * FROM customers
LIMIT 10;

CREATE INDEX customerid_bookid_idx ON orders(customer_id, book_id);
DROP INDEX IF EXISTS customerid_bookid_idx;

EXPLAIN ANALYZE SELECT customer_id, book_id, quantity FROM orders
WHERE quantity > 20;

CREATE INDEX customerid_bookid_qty_idx ON orders(customer_id, book_id, quantity);

EXPLAIN ANALYZE SELECT customer_id, book_id, quantity FROM orders
WHERE quantity > 20;

CREATE INDEX author_title_idx ON books(author, title);

EXPLAIN ANALYZE SELECT * FROM orders
WHERE quantity * price_base > 100;

CREATE INDEX order_total_price_idx ON orders ((quantity * price_base));

EXPLAIN ANALYZE SELECT * FROM orders
WHERE quantity * price_base > 100;

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;

DROP INDEX IF EXISTS books_author_idx;

DROP INDEX IF EXISTS customerid_bookid_qty_idx;

CREATE INDEX customers_last_name_first_name_email_address ON customers (last_name, first_name, email_address);

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;