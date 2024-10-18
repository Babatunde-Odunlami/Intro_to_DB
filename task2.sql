import mysql.connector as sql
from mysql.connector import Error

# Database connection details (replace with your own)
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Temitope@2024#",
    auth_plugin="mysql_native_password",
)
mycursor = mydb.cursor()


# Specify what database to use going forward
mycursor.execute("USE alx_book_store")

try:
    # Create a table named `Books` (if it doesn't exist)
    mycursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Books (
        book_id INT PRIMARY KEY NOT NULL,
        title VARCHAR(130),
        author_id INT NOT NULL,
        price DOUBLE,
        publication_date DATE
        )
        """
    )
except sql.Error as e:
    print(f"Error creating Books table")


try:
    # Create a table named `Authors` (if it doesn't exist)
    mycursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Authors (
        author_id INT PRIMARY KEY NOT NULL,
        author_name VARCHAR(215)
        )
        """
    )
except sql.Error as e:
    print(f"Error creating Authors table")

try:
    # Create a table named `customers` (if it doesn't exist)
    mycursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Customers (
        customer_id INT NOT NULL PRIMARY KEY,
        customer_name VARCHAR(215),
        email VARCHAR(215),
        address TEXT )
        """
    )
except sql.Error as e:
    print(f"Error creating Customers table")

try:
    # Create a table named `Orders` (if it doesn't exist)
    mycursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Orders (
        order_id INT PRIMARY KEY,
        customer_id INT NOT NULL,
        order_date DATE )
        """
    )
except sql.Error as e:
    print(f"Error creating Orders table")

try:
    # Create a table named `Order_details` (if it doesn't exist)
    mycursor.execute(
        """
        CREATE TABLE IF NOT EXISTS Order_Details (
        orderdetailid INT PRIMARY KEY NOT NULL,
        order_id INT,
        book_id INT,
        quantity DOUBLE)
        """
    )
except sql.Error as e:
    print(f"Error creating order_details table")

try:
    mycursor.execute(
        """ 
        ALTER TABLE Books
        ADD CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES Authors (author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
        """
    )
    print(f"Altering Books table successfull!")
except sql.Error as e:
    print(f"Error altering Books table")

try:
    mycursor.execute(
        """ 
        ALTER TABLE Orders
        ADD CONSTRAINT fk_order FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
        """
    )
except sql.Error as e:
    print(f"Error altering Orders table")

try:
    mycursor.execute(
        """ 
        ALTER TABLE Order_Details
        ADD CONSTRAINT fk_order_details FOREIGN KEY (order_id) REFERENCES Orders (order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
        """
    )
except sql.Error as e:
    print(f"Error altering Orders table")

try:
    mycursor.execute(
        """ 
        ALTER TABLE Order_Details
        ADD CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES Books (book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
        """
    )
except sql.Error as e:
    print(f"Error altering Orders table")
