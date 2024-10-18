import mysql.connector
from mysql.connector import Error

mydb =mysql.connector.connect(host="localhost",user="root",password="Temitope@2024#",auth_plugin="mysql_native_password")
mycursor =mydb.cursor()
mycursor.execute("USE alx_book_store;")

try:
	mycursor.execute(
        """
        INSERT INTO customer(customer_id, customer_name, email, address)
        VALUES(1, "Cole Baidoo", "cbaidoo@sandtech.com","123 Happiness Ave.")
        """)
except mysql.connector.Error:
	pass


try:
    # Create a table named `customers` (if it doesn't exist)
    mycursor.execute(
        """
        INSERT INTO Customers(customer_id, customer_name, email, address)
	VALUES(2, "Blessing Malik", "bmalik@sandtech.com","124 Happiness  Ave."),
	(3, "Obed Ehoneah", "eobed@sandtech.com","125 Happiness  Ave."),
	(2, "Nehemial Kamolu", "nkamolu@sandtech.com","126 Happiness  Ave.")
        """
    )

	mydb.commit()
except mysql.connector.Error as e:
    print(f"Error populating table")
finally:
	mycursor.close()
"task_2.sql" [readonly] 92L, 2456C                                                                                     87,1          Bot
