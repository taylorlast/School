USE ClassicModels;

SELECT country, COUNT(DISTINCT orderNumber)
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
WHERE creditLimit > 100000
GROUP BY country
HAVING COUNT(DISTINCT orderNumber) > 10;

SELECT DISTINCT productName
FROM Products
JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
WHERE MSRP > (SELECT 1.15*AVG(priceEach) FROM Products WHERE Products.productCode = OrderDetails.productCode);

SELECT Emp.firstname, Emp.lastname
FROM Employees AS Emp
JOIN Employees AS Boss ON Emp.reportsTo = Boss.employeeNumber
WHERE Emp.lastname = Boss.lastname;

SELECT productVendor, CONCAT(ROUND(COUNT(DISTINCT productCode) / (SELECT COUNT(productCode) FROM Products) * 100,2),"%")
FROM Products
GROUP BY productVendor
ORDER BY COUNT(DISTINCT productCode) / (SELECT COUNT(productCode) FROM Products) * 100;

SELECT customerName
FROM Customers
WHERE (country = "Ireland" OR country = "USA")
AND NOT EXISTS (SELECT checkNumber FROM Payments WHERE Customers.customerNumber = Payments.customerNumber);



