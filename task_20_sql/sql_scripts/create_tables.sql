CREATE TABLE AUTHORS(
authors_id int PRIMARY KEY,
author_name varchar NOT NULL,
country_of_origin varchar NOT NULL,
number_of_books_written int
)

CREATE TABLE BOOKS(
book_id int PRIMARY KEY,
title varchar NOT NULL,
authors_id int REFERENCES Authors(authors_id),
genre varchar NOT NULL,
date_of_publication date,
publisher varchar NOT NULL,
isbn varchar NOT NULL,
language varchar NOT NULL,
available_copies int,
age_rating varchar NOT NULL

)

DROP IF EXISTS fulfillment_status CASCADE;
CREATE TYPE fulfillment_status as ENUM('processing', 'pending', 'fulfilled');
CREATE TABLE BOOKORDERS(
order_id int PRIMARY KEY,
order_date date,
book_id int REFERENCES BOOKS(book_id),
cost decimal,
quantity int,
supply_date date,
fulfillment_status fulfillment_status DEFAULT 'processing',
supplier_name varchar NOT NULL
)


ALTER TABLE MEMBERS
ADD COLUMN address varchar NOT NULL;
CREATE TYPE status as ENUM ('active', 'suspended');
CREATE TYPE type_of_membership as ENUM ('student','standard', 'premium');
CREATE TYPE gender as ENUM('male', 'female');
CREATE TABLE MEMBERS(
membership_id int PRIMARY KEY,
member_name varchar NOT NULL,
gender gender NOT NULL,
email_address varchar NOT NULL,
phone_number varchar NOT NULL,
age int,
type_of_membership type_of_membership DEFAULT 'student',
date_of_membership date,
status status DEFAULT 'active'

)


CREATE TABLE BORROWEDHISTORY(
borrowed_id int,
book_id int REFERENCES BOOKS(book_id),
membership_id int REFERENCES MEMBERS(membership_id),
borrow_date date,
return_date date
)




CREATE TABLE DEPARTMENTS(
dept_id int PRIMARY KEY,
department_name varchar NOT NULL,
manager_name varchar NOT NULL

)




CREATE TABLE LIBRARYSTAFF(
staff_id int PRIMARY KEY,
staff_name varchar NOT NULL,
job_title varchar NOT NULL,
dept_id int REFERENCES DEPARTMENTS(dept_id),
gender gender NOT NULL,
address varchar NOT NULL,
phone_number varchar NOT NULL,
hire_date date,
manager_id int
)








