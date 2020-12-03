USE ClassicModels;


SELECT customerName, COUNT(DISTINCT Orders.orderNumber), COUNT(OrderDetails.productCode)
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
WHERE status = "In Process"
GROUP BY customerName;

SELECT customerName
FROM Customers
WHERE NOT EXISTS (SELECT customerNumber FROM Orders WHERE Customers.customerNumber = Orders.customerNumber)
ORDER BY customerName;

SELECT Offices.addressLine1, Offices.addressLine2, (SELECT COUNT(employeeNumber) FROM Employees WHERE Offices.officeCode = Employees.officeCode), count(employeeNumber)
FROM Offices
JOIN Employees ON Offices.officeCode = Employees.officeCode
JOIN Customers ON Employees.employeeNumber = Customers.salesRepEmployeeNumber
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
GROUP BY Offices.officeCode;

SELECT emp.lastName, emp.firstName, emp.extension
FROM Employees AS Boss
JOIN Employees AS emp ON emp.reportsTo = Boss.employeeNumber
WHERE Boss.jobTitle = emp.jobTitle;

SELECT customerName, COUNT(DISTINCT orderNumber), SUM(amount)
FROM Customers
JOIN Payments ON Customers.customerNumber = Payments.customerNumber
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
GROUP BY customerName
HAVING COUNT(DISTINCT orderNumber) > 10
ORDER BY SUM(amount) DESC;








