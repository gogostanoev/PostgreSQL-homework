-- Homework requirement 1/6
-- Find all Employees with FirstName = Antonio (change Marko)
-- Find all Employees with DateOfBirth greater than ‘01.01.1979’
-- Find all Male Employees 
-- Find all Employees with LastName starting With ‘T’
-- Find all Employees hired in January/1988
-- Find all Employees with LastName starting With ‘J’ hired in January/1988


SELECT * FROM employee
WHERE FirstName = 'Marko';


SELECT * FROM employee
WHERE dateofbirth > '01.01.1979';


SELECT * FROM employee
WHERE gender = 'M';


SELECT * FROM employee
WHERE LastName LIKE 'T%';


SELECT * FROM employee
WHERE hiredate BETWEEN '2011-01-01' AND '2011-12-31';


SELECT * FROM employee
WHERE hiredate BETWEEN '2011-01-01' AND '2011-12-31'
AND LastName LIKE 'N%';



-- Homework requirement 2/6
-- Find all Employees with FirstName = Antonio ordered by Last Name
-- List all Employees ordered by FirstName
-- Find all Male employees ordered by HireDate, starting from the last hired


SELECT * FROM employee
WHERE FirstName = 'Marko'
ORDER BY LastName;


SELECT * FROM employee
ORDER BY FirstName;


SELECT * FROM employee
WHERE GENDER = 'M'
ORDER BY hiredate DESC;



-- Homework requirement 3/6
-- List all Business Entity region and Customer region names in single result set WITH duplicates
-- List all Business Entity region and Customer region names in single result set WITHOUT duplicates
-- List all common region names between Business Entities and Customers


SELECT * FROM businessentity;

SELECT * FROM customer;


SELECT region from businessentity
UNION ALL
SELECT regionname from customer;


SELECT region from businessentity
UNION
SELECT regionname from customer;


SELECT region FROM businessentity
INTERSECT
SELECT regionname FROM customer;



-- Homework requirement 4/6
-- Provide create table script for the Order table where it won’t allow an orderDate before 01.01.2010
-- Provide create table script for the Product table where the price will always be AT LEAST 20% higher than the cost
-- Provide create table script for the Product table where all description values will be UNIQUE


SELECT * FROM "Order";

ALTER TABLE IF EXISTS "Order"
ADD CONSTRAINT order_date_check CHECK (OrderDate >= DATE '2010-01-01');

-- DOES NOT WORK!!
SELECT * FROM Product;

ALTER TABLE Product
ADD CONSTRAINT check_price_cost CHECK (Price >= Cost * 1.2);

ALTER TABLE Product
ADD CONSTRAINT unique_description UNIQUE (Description);