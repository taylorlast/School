USE ClassicModels;

SELECT customerName
FROM Customers
JOIN Orders On Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
WHERE country = 'Italy' AND priceEach > 200;

SELECT customerName, COUNT(checkNumber)
FROM Customers
JOIN Payments ON Customers.customerNumber = Payments.customerNumber
WHERE amount > 20000 AND country = 'USA'
GROUP BY customerName
HAVING COUNT(checkNumber) > 5;

SELECT productName
FROM Products
JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
JOIN Orders ON OrderDetails.orderNumber = Orders.orderNumber
WHERE productLine = 'MotorCycles'
GROUP BY productName
HAVING COUNT(DISTINCT customerNumber) > 25
AND SUM(quantityOrdered * priceEach)>100000;

SELECT Offices.country, COUNT(customerNumber)
FROM Offices
JOIN Employees ON Offices.officeCode = Employees.officeCode
JOIN Customers ON Employees.employeeNumber = Customers.salesRepEmployeeNumber
WHERE Offices.country != Customers.country
GROUP BY Offices.country;

SELECT ProductLines.productLine, COUNT(*)
FROM ProductLines
JOIN Products ON ProductLines.productLine = Products.productLine
WHERE MSRP > (SELECT 1.5*AVG(MSRP) FROM Products WHERE Products.productLine = ProductLines.productLine)
GROUP BY productLine
HAVING COUNT(*) > 1;


