# import all necessary libraries

import pandas as pd
from sqlalchemy import create_engine

# 
USER ='postgres'
PASSWORD = 'kanyisola'
HOST = 'localhost'
PORT = '5432'
DB = 'library_db'

# Create database connection
engine = create_engine(f'postgresql://{USER}:{PASSWORD}@{HOST}:{PORT}/{DB}')

# Load all the database
books = pd.read_sql("SELECT * FROM Books", engine)
authors = pd.read_sql("SELECT * FROM Authors", engine)
book_orders = pd.read_sql("SELECT * FROM BookOrders", engine)
borrow_history = pd.read_sql("SELECT * FROM Borrowedhistory", engine)
members = pd.read_sql("SELECT * FROM Members", engine)
library_staff = pd.read_sql("SELECT * FROM LibraryStaff", engine)
departments = pd.read_sql("SELECT * FROM Departments", engine)

# Display the book_orders
book_orders.head()