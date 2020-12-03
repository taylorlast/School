USE ClassicModels;

#1
SELECT Products.productName, Products.productCode, AVG(quantityOrdered)
FROM Products
LEFT JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
WHERE productName REGEXP "^198"
GROUP BY Products.productName, Products.productCode
ORDER BY AVG(quantityOrdered) DESC;

#2
SELECT customerName, CONCAT(Employees.firstName, " ", Employees.lastName) AS "Sales Rep"
FROM Customers
LEFT JOIN Employees ON Customers.salesRepEmployeeNumber = Employees.employeeNumber
WHERE Customers.country = "Spain";

#3
SELECT
COUNT(CASE WHEN Customers.country IN ("USA", "Canada") THEN customerNumber END) AS 'Num_North_American_Customers',
COUNT(CASE WHEN Customers.country IN ("Australia", "New Zealand") THEN customerNumber END) AS 'Num_Oceania_Customers',
COUNT(CASE WHEN Customers.country NOT IN ("USA", "Canada", "Australia", "New Zealand") THEN customerNumber END) AS 'Num_Customers_Other',
COUNT(CASE WHEN Customers.country != "Dummy Country" THEN customerNumber END) AS 'Num_Customers_Total'
FROM Customers;

#4
SELECT CONCAT(Employees.firstName, " ", Employees.lastName) AS "Sales Rep", COUNT(DISTINCT customerNumber)
FROM Employees
LEFT JOIN Customers ON Employees.employeeNumber = Customers.salesRepEmployeeNumber
GROUP BY CONCAT(Employees.firstName, " ", Employees.lastName)
HAVING COUNT(DISTINCT customerNumber) <= 5;

#5
SELECT month(orderDate) AS "Month", COUNT(orderNumber) AS "Number of Orders"
FROM Orders
WHERE year(orderDate) = 2004
GROUP BY month(orderDate)
ORDER BY month(orderDate) DESC;

#6
SELECT customerName, customerNumber,
	CASE 
		WHEN customerName REGEXP "mini" AND Customers.country = Offices.country THEN 'rep in same country'
        ELSE 'rep in different country' END AS 'Rep in Same Country?'
FROM Customers
JOIN Employees ON Customers.salesRepEmployeeNumber = Employees.employeeNumber
JOIN Offices USING (officeCode)
WHERE customerName REGEXP "mini";

#7
SELECT CONCAT(boss.firstName, " ", boss.lastName), boss.employeeNumber, COUNT(emp.reportsTo)
FROM Employees AS boss
LEFT JOIN Employees AS emp ON emp.reportsTo = boss.employeeNumber
WHERE boss.officeCode = 6
GROUP BY CONCAT(boss.firstName, " ", boss.lastName), boss.employeeNumber;






























