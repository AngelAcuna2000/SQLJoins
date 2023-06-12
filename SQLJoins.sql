/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT Products.Name, 
Categories.Name AS Category
FROM Products
INNER JOIN Categories 
ON Products.CategoryID = Categories.CategoryID
WHERE Categories.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT Products.Name, 
Products.Price, 
Reviews.Rating
FROM Products
INNER JOIN Reviews 
ON Products.ProductID = Reviews.ProductID
WHERE Reviews.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT Employees.FirstName, 
Employees.LastName, 
SUM(Sales.Quantity) AS Total
FROM Sales 
INNER JOIN Employees 
ON Sales.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID
ORDER BY Total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT Departments.Name AS Department, 
Categories.Name AS Category
FROM Categories
INNER JOIN Departments 
ON Categories.DepartmentID = Departments.DepartmentID
WHERE Categories.Name = 'Appliances' 
OR Categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT Products.Name, 
 SUM(Sales.Quantity) AS 'Total Sales', 
 SUM(PricePerUnit) AS 'Total Price'
 FROM Sales
 INNER JOIN Products 
 ON Sales.ProductID = Products.ProductID
 WHERE Products.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT Products.Name, 
Reviews.Reviewer, 
Reviews.Rating, 
Reviews.Comment
FROM Reviews
INNER JOIN Products 
ON Reviews.ProductID = Reviews.ProductID
WHERE Products.Name = 'Visio TV' AND Reviews.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT Employees.EmployeeID, 
Employees.FirstName, 
Employees.LastName, 
Products.Name AS Product, 
Sales.Quantity AS 'Quantity Sold'
FROM Sales
INNER JOIN Employees
ON Sales.EmployeeID = Employees.EmployeeID
INNER JOIN Products
ON Sales.ProductID = Products.ProductID;