import mysql.connector as sql
from mysql.connector import Error

# Database connection details (replace with your own)
mydb = mysql.connector.connect(
    host = "localhost", user = "root", password = "Temitope@2024#", auth_plugin = 'mysql_native_password' 
)
mycursor = mydb.cursor()

try:
    # Create a database named 'alx_book_store' (if it doesn't exist)
    mycursor.execute(
        """
        CREATE DATABASE IF NOT EXISTS alx_book_store
        CHARACTER SET utf8mb4
        COLLATE utf8mb4_unicode_ci
        """
        )
    print("Database 'alx_book_store' created successfully!")
except sql.Error as e:
    if e.errno == sql.errorcode.ER_DB_CREATE_EXISTS:
        print(f"Database 'alx_book_store' already exists."
    else:
    print(f"Error creating alx_book_store database")
