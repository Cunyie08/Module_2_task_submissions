
import pandas as pd
from sqlalchemy import create_engine

# Create database connection
engine = create_engine('postgresql://postgres:kanyisola@localhost:5432/library_db')

# Example: Load data
df_books = pd.read_sql("SELECT * FROM Books", engine)
df_authors = pd.read_sql("SELECT * FROM Authors", engine)

df_books.head()

# Your Pandas queries here
