USE ClassicModels;

SELECT city, country, COUNT(employeeNumber)
FROM Offices
JOIN Employees ON Offices.officeCode = Employees.officeCode
GROUP BY city, country
ORDER BY COUNT(employeeNumber) DESC;

SELECT customerName, AVG(Payments.amount) AS customerAVG
FROM Customers
JOIN Payments ON Customers.customerNumber = Payments.customerNumber
GROUP BY customerName
HAVING customerAVG < (SELECT AVG(amount) FROM Payments)
ORDER BY customerAVG DESC;

SELECT customerName, COUNT(amount) AS numOfPayments
FROM Customers
JOIN Payments ON Customers.customerNumber = Payments.customerNumber
WHERE amount > (SELECT AVG(amount) FROM Payments)
GROUP BY customerName
ORDER BY numOfPayments DESC;

SELECT productName, CONCAT(COUNT(DISTINCT customerNumber)/ (SELECT COUNT(customerNumber) FROM Customers) * 100, "%") AS "perBoughtByCust"
FROM Orders
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON Products.productCode = OrderDetails.productCode
GROUP BY productName;

