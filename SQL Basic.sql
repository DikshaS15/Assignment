create database assignment;
use assignment;


/* 1. Create a table called employees with the following structure?
: emp_id (integer, should not be NULL and should be a primary key).
: emp_name (text, should not be NULL).
: age (integer, should have a check constraint to ensure the age is at least 18).
: email (text, should be unique for each employee).
: salary (decimal, with a default value of 30,000).
Write the SQL query to create the above table with all constraints.*/


CREATE TABLE employees
 (emp_id INTEGER NOT NULL PRIMARY KEY,
 emp_name TEXT NOT NULL,
 email_id int UNIQUE,
 age INTEGER CHECK (age >= 18),
 salary DECIMAL DEFAULT 30000);

select * from employees;


/*2.Explain the purpose of constraints and how they help maintain data integrity in a database.Provide examples of common types of constraints.

Ans-2 Constraints are essential in databases as they ensure data integrity, accuracy, and consistency. 
They enforce rules at the table and column level, 
preventing invalid data from being entered into the database. 
Here are some common types of constraints and their purposes:

1. Primary Key Constraint: Ensures that each row in a table has a unique identifier. The primary key column(s) must contain unique values and cannot be NULL.

Example: In the employees table, emp_id is a primary key constraint.

2. Foreign Key Constraint: Ensures that the values in a column or a set of columns match values in another table’s primary key. This helps maintain referential integrity between tables.

Example: In an orders table, the customer_id column might be a foreign key that references the customers table's customer_id column.

3. Unique Constraint: Ensures that all values in a column or a set of columns are unique across the table.

Example: In the employees table, the email column has a unique constraint, meaning no two employees can have the same email address.

4. Not Null Constraint: Ensures that a column cannot have NULL values.

Example: In the employees table, emp_name has a NOT NULL constraint, meaning every employee must have a name.

5. Check Constraint: Ensures that all values in a column satisfy a specific condition.

Example: In the employees table, the age column has a CHECK constraint to ensure that the age is at least 18.

6. Default Constraint: Provides a default value for a column when no value is specified.

Example: In the employees table, the salary column has a default value of 30,000.

These constraints help ensure that the data in your database is accurate, consistent, and reliable. 
By enforcing these rules, you prevent errors and maintain the integrity of your data.*/


/* 3. Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.

Ans-3 Applying the NOT NULL constraint to a column ensures that every row in the table must have a value for that column. 
This is crucial for maintaining data integrity and accuracy. For example, in a table of employees, 
it would make sense to ensure that every employee has a name (emp_name should be NOT NULL). 
This constraint prevents the insertion of rows with missing or undefined values in that column, 
which could lead to issues in data analysis and reporting.

Justification for NOT NULL constraint:
1. Data Completeness: Ensures that essential data is not missing.

2. Data Integrity: Prevents accidental omission of values.

3. Business Rules: Enforces rules like every employee must have a name, an order must have a date, etc.

Regarding primary keys, a primary key cannot contain NULL values. 
The primary key is used to uniquely identify each row in a table,
and it must be unique and contain a value for every record.

Justification:
1. Uniqueness: Primary keys must uniquely identify each row. Allowing NULL values would contradict this requirement, 
as NULL is considered an unknown or undefined value, and multiple rows could have NULL values.

2. Integrity: Ensures each row can be referenced accurately by other tables using foreign keys. 
If a primary key contained NULL values,it could lead to ambiguity and issues with referential integrity.

Here's a quick example: In the employees table, emp_id is a primary key and therefore it cannot be NULL. This ensures every employee can be uniquely identified and referenced without ambiguity.*/


/* 4.  Explain the steps and SQL commands used to add or remove constraints on an existing table.
 Provide an example for both adding and removing a constraint.

Ans-4 Adding or removing constraints on an existing table involves altering the table's structure using the ALTER TABLE command.
Let's go through the steps and examples for both adding and removing a constraint.

1. Adding a Constraint: To add a constraint to an existing table, you use the ALTER TABLE statement followed by the specific type of constraint you want to add.
Example: Let's add a NOT NULL constraint to the email column in the employees table.
ALTER TABLE employees
MODIFY email_id TEXT NOT NULL;

2. Removing a Constraint: To remove a constraint, you typically need to know the constraint's name. 
If the constraint was automatically named by the database system, you may need to look it up in the database metadata.
Example: Let's remove the UNIQUE constraint from the email column in the employees table. Assuming the constraint was named unique_email:
ALTER TABLE employees
DROP CONSTRAINT unique_email;

If you need to remove a NOT NULL constraint, the syntax might differ slightly depending on the database system you're using. Here’s a generic example:
ALTER TABLE employees
MODIFY email TEXT NULL;

Summary
1. Adding a Constraint: Use ALTER TABLE followed by the specific constraint addition command.

Example: Adding a NOT NULL constraint.

2. Removing a Constraint: Use ALTER TABLE followed by the DROP CONSTRAINT command.

Example: Removing a UNIQUE constraint.
By using these commands, you can manage the constraints on your tables to ensure data integrity and meet the specific requirements of your database schema.*/


/* 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.

Ans-5 When you attempt to insert, update, or delete data in a way that violates constraints, the database management system (DBMS) will prevent the operation and raise an error. 
These constraints are enforced to maintain data integrity and consistency within the database.

Consequences of Violating Constraints

1. Insert Violations: If you try to insert a row with data that violates any constraints, the insert operation will fail.
For example, inserting a duplicate value into a column with a unique constraint will result in an error.

2. Update Violations: If you attempt to update a row such that it violates any constraints, the update operation will fail.
For example, updating a column to a NULL value when it has a NOT NULL constraint will result in an error.

3. Delete Violations: If you try to delete a row that is referenced by a foreign key in another table, the delete operation will fail unless cascading is set up.

Example Error Messages
Here are some examples of error messages that might occur when violating constraints:

1. Unique Constraint Violation:
  Error Message: ERROR: duplicate key value violates unique constraint "unique_email"
  Example: Attempting to insert a row with an email that already exists in the email column, which has a unique constraint.
  
2. Not Null Constraint Violation:
   Error Message: ERROR: null value in column "emp_name" violates not-null constraint
   Example: Attempting to insert a row with a NULL value in the emp_name column, which has a NOT NULL constraint.
   
3. Check Constraint Violation:
   Error Message: ERROR: new row for relation "employees" violates check constraint "age_check"
   Example: Attempting to insert a row with an age value less than 18 when the age column has a CHECK constraint to ensure the age is at least 18.
   
4. Foreign Key Constraint Violation:
   Error Message: ERROR: insert or update on table "orders" violates foreign key constraint "orders_customer_id_fkey"
   Example: Attempting to insert a row with a customer_id value that does not exist in the customers table, which has a foreign key constraint.
   
These error messages indicate which constraint was violated and help identify the specific issue so that you can correct the data before retrying the operation.*/


/* QUESTION-6 SOLUTION*/

create table Product
 ( Product_id int,
 Product_name varchar (50), 
 Price Decimal (10.2) );
 
select * from Product;


ALTER TABLE Product
ADD CONSTRAINT primary key (Product_id);

ALTER TABLE product
ADD CONSTRAINT check_price CHECK (price > 0); -- Ensure prices are positive

-- Optional: Add a default value for price (if applicable)
ALTER TABLE Product
ALTER COLUMN price SET DEFAULT 50;  -- Or some other appropriate default

select * from Product;


-- 7. You have 2 tables Students and Classes- Write a query to fetch the student_name and class_name for each student using an INNER JOIN.


create table STUDENTS 
( Student_id int,
Student_name varchar(10),
Class_id int);


Create table CLASSES
 ( Class_id int,
 Class_name varchar(10) );
 
 
 insert into STUDENTS ( Student_id, student_name, class_id) values
 ( 1, "Alice", 101), ( 2, "Bob", 102), ( 3, "Charlie", 103);
 
 select * from STUDENTS;
 select * from classes;
 
 insert into Classes ( class_id, class_name) values
 ( 101, "Maths"), ( 102, "Science"), ( 103, "History");
 
 
 SELECT students.student_name, classes.class_name
FROM students
INNER JOIN classes
ON students.class_id = classes.class_id;



/* 8. Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order Hint: (use INNER JOIN and LEFT JOIN).

Solution-8*/


Create table Orders
( order_id char(50), 
order_date char(50), 
customer_id char(50));
drop table orders;

Create table Customers
( Customer_id int, 
Customer_name varchar(10) );

create table Products
 ( Product_id char(10),
 Product_name varchar (10), 
 order_id char (10) );


insert into ordres ( order_id, order_date, customer_id) values
 ( 1, 2024-01-01, 101), ( 2, 2024-01-03, 102);
 
 
 insert into customers ( customer_id, customer_name) values
 ( 101, "Alice"), ( 102, "Bob");
 
 
insert into Products ( Product_id, Product_name, order_id) values
 ( 1, "Laptop", 1), ( 2, "Phone", "null");
 
 select * from Customers;
 select * from orders;
 select * from Products;
 
 
SELECT orders.order_id, customers.customer_name, products.product_name
FROM products
LEFT JOIN orders ON products.product_id = orders.product_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id;



/* 9. Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

Solution-9 */


create table sales
( sale_id char(30),
product_id char (30),
amount int);


insert into sales ( sale_id, product_id, amount) values
 ( 1, 101, 500), ( 2, 102, 300), ( 3, 101, 700);
 
 select * from sales;
 
 
SELECT products.product_name, SUM(orders.quantity * orders.price) AS total_sales_amount
FROM orders
INNER JOIN products ON orders.product_id = products.product_id
GROUP BY products.product_name;



/* 10. Write a query to display the order_id, customer_name, and the quantity of products ordered by each
customer using an INNER JOIN between all three tables.

Solution-10 */


Create table Orders
( order_id char(50), 
order_date char(50), 
customer_id char(50));


Create table Customers
( Customer_id int, 
Customer_name varchar(10) );


Create table orderDetail
( order_id char(30), 
product_id char(30),
quantity int );


insert into orderDetail ( order_id, product_id, quantity) values
 ( 1, 101, 2), ( 1, 102, 1), ( 2, 101, 3);
 
 
 insert into ordres ( order_id, order_date, customer_id) values
 ( 1, 2024-01-02, 1), ( 2, 2024-01-05, 2);
 
 
insert into customers ( customer_id, customer_name) values
 ( 1, "Alice"), ( 2, "Bob");
 
select * from orderDetail;
select * from ordres;
select * from customers;


SELECT orders.order_id, customers.customer_name, orders.quantity
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id
INNER JOIN products ON orders.product_id = products.product_id;


