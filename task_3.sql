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
mycursor.execute("USE alx_book_store;")

try:
    # Create a table named `customers` (if it doesn't exist)
    mycursor.execute(
        """
        SHOW TABLES
        """
    )
    result = mycursor.fetchall()
    for table in result:
        print(table)
except sql.Error as e:
    print(f"Error creating Customers table")

finally:
    # Close the cursor and connection
    mycursor.close()

