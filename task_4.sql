import mysql.connector as sql
from mysql.connector import Error
#INFORMATION_SCHEMA.COLUMNS", "COLUMN_NAME", "COLUMN_TYPE", "TABLE_SCHEMA = 'alx_book_store'", "TABLE_NAME = 'Books

# Database connection details (replace with your own)
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Temitope@2024#",
    auth_plugin="mysql_native_password",
)
mycursor = mydb.cursor()
database_name = "alx_book_store"
table_name = "Books"


# Specify what database to use going forward
mycursor.execute(f"USE {database_name}")

try:
    # Create a table named `customers` (if it doesn't exist)
    mycursor.execute(
        """
        SELECT INFORMATION_SCHEMA.COLUMNS, COLUMN_NAME,COLUMN_TYPE 
        FROM information_schema.COLUMNS
        WHERE TABLE_SCHEMA = %s AND TABLE_NAME = %s
        """,
        ("alx_book_store", TABLE_NAME = 'Books'),
    )
    result = mycursor.fetchall()

    # result will be a list of a list
    for column in result:
        print(column)
        # print(f"COLUMN: {column[0]}, DATATYPE: {column[1]}, IS_NULLABLE: {column[2]}")
except sql.Error as e:
    print(f"Error creating Customers table")
finally:
    # Close the cursor
    mycursor.close()
