--creating the alx_book_store database
CREATE DATABASE IF NOT EXISTS alx_book_store
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- specify thr database to use
USE alx_book_store;

--creating Authors table
CREATE TABLE IF NOT EXISTS Authors (
author_id INT PRIMARY KEY NOT NULL,
author_name VARCHAR(215)
);

-- create the Books table
CREATE TABLE IF NOT EXISTS Books (
book_id INT PRIMARY KEY NOT NULL,
title VARCHAR(130),
author_id INT NOT NULL,
price DOUBLE,
publication_date DATE,
FOREIGN KEY (author_id) REFERENCES Authors (author_id)
);

--creating customers table
CREATE TABLE IF NOT EXISTS Customers (
customer_id INT NOT NULL PRIMARY KEY,
customer_name VARCHAR(215),
email VARCHAR(215),
address TEXT
);

--creating Orders table
CREATE TABLE IF NOT EXISTS Orders (
order_id INT PRIMARY KEY,
customer_id INT NOT NULL,
order_date DATE
FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
);


--creating Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
orderdetailid INT PRIMARY KEY NOT NULL,
order_id INT,
book_id INT,
quantity DOUBLE
FOREIGN KEY (order_id) REFERENCES Orders (order_id)
FOREIGN KEY (book_id) REFERENCES Books (book_id)
);

