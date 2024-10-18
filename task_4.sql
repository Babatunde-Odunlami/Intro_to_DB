Iimport mysql.connector as sql
from mysql.connector import Error

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
        SELECT * 
        FROM information_schema.COLUMNS
        WHERE TABLE_SCHEMA = %s AND TABLE_NAME = %s
        """,
        (database_name, table_name),
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
