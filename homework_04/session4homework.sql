-- Homework requirement 1/3
-- Calculate “(price + cost) / weight” for all products

SELECT (price + cost) / weight AS CalculatedProducts
FROM product;


-- Get a round number that is higher or equal for the costs and a round number that is lower or equal for the prices for all products.

SELECT CEILING(cost) AS CostValue,
FLOOR(price) AS PriceValue
FROM product;


-- Get all orders and generate a random number between 0 and 100 for every order.

SELECT id,
FLOOR(random() * 100) AS RandomNumber
FROM "Order";


-- Concatenate the name, region and zipcode from every business entity and add the delimiter ‘; ‘ between them.

SELECT 
CONCAT (name, '; ', region, '; ', zipcode) AS ConcatColumn
FROM businessentity;


-- Declare temp table that will contain LastName and HireDate columns. The HireDate column must not allow dates after 01.01.2010. Insert 5 rows of dummy data and display every row inserted.

CREATE TEMPORARY TABLE Information (
	lastname varchar(20),
	hiredate date CHECK(hiredate <= '2010-01-01')
);

INSERT INTO Information (lastname, hiredate)
VALUES
    ('Stankovska', '2009-07-15'),
    ('Dimitrov', '2008-04-30'),
    ('Sarafiloski', '2010-01-01'),
    ('Ivanov', '2007-09-22'),
    ('Stanoev', '2009-03-10');
	
SELECT * FROM Information;	


-- Homework requirement 2/3
-- Create a function (get_employees_hired_later_than) that will return all employees that were hired after a provided date. Return the following columns:
-- The first and last name concatenated into one column with a space between them. The column should be named “Full name”.
-- The age that the employee was at the time he was employed. Column should be named “Age of employee on hiring”.
-- The national ID number concatenated with the gender, with a ‘; ‘ delimiter between them.

CREATE OR REPLACE FUNCTION get_employees_hired_later_than(hire_date date) RETURNS TABLE (
	fullname varchar(200),
	age_of_employee_on_hiring INT,
	national_ID_and_gender varchar(30)
)
AS $$

BEGIN 
RETURN QUERY

SELECT
CONCAT (firstname, ' ', lastname)::varchar(200) AS fullname,
EXTRACT(YEAR FROM AGE(hiredate, dateofbirth))::INT AS age_of_employee_on_hiring,
CONCAT(nationalidnumber, '; ', gender)::varchar(30) AS national_ID_and_gender

FROM employee
WHERE hiredate > hire_date;

END;
$$ LANGUAGE plpgsql; 


SELECT * FROM get_employees_hired_later_than('2011-10-18');


-- Homework requirement 3/3
-- Create a function (get_employee_orders) that will return all orders done by a specific employee. Return the following columns:
-- The first 3 letters of the name, the last 3 characters of the code and the full description concatenated delimited with the character ‘; ‘ of the product for which the order was made.
-- The quantity of the order.
-- The business entity name for which the order was made.

CREATE OR REPLACE FUNCTION get_employee_orders(order_by_employee INT) RETURNS TABLE(
	product_description VARCHAR(200),
	quantity INT,
	business_entity_name VARCHAR(100)
)
AS $$

BEGIN
RETURN QUERY

SELECT
CONCAT(LEFT(p.name, 3), '; ', RIGHT(p.code, 3), '; ', p.description)::VARCHAR AS product_description,
od.quantity AS quantity,
be.name AS business_entity_name

FROM "Order" AS o 
INNER JOIN orderdetails od ON o.id = od.orderid
INNER JOIN product p ON od.productid = p.id
INNER JOIN businessentity AS be ON o.businessentityid = be.id
WHERE o.employeeid = order_by_employee;

END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_employee_orders(3);
SELECT * FROM get_employee_orders(5);