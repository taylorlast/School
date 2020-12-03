USE ClassicModels;

#QUERY 1
SELECT productName, productLine, (MSRP - buyPrice) AS "difference"
FROM Products
ORDER BY productLine, difference DESC;

#QUERY 2
SELECT productName, productVendor
FROM Products
WHERE productScale = "1:700" AND productLine = "Ships";

#QUERY 3
SELECT customerName, phone
FROM Customers
WHERE creditLimit < (SELECT AVG(creditLimit) FROM Customers);

#QUERY 4
SELECT COUNT(*) AS "customersInUSA"
FROM Customers
WHERE country = "USA";

#QUERY 5
SELECT COUNT(*)
FROM Employees
WHERE jobTitle REGEXP "Sales";
