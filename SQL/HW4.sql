USE ClassicModels;

SELECT emp.lastName, emp.firstName, emp.extension
FROM Employees AS emp
JOIN Employees AS boss ON emp.reportsTo = boss.employeeNumber
WHERE boss.jobTitle = emp.jobTitle;

SELECT Offices.country, COUNT(customerNumber)
FROM Offices
JOIN Employees USING (officeCode)
JOIN Customers ON Employees.employeeNumber = Customers.salesRepEmployeeNumber
WHERE Customers.country != Offices.country
GROUP BY Offices.country
HAVING COUNT(customerNumber) = (SELECT MAX(nosOfCusts)
        FROM
        (SELECT COUNT(customerNumber) AS nosOfCusts
        FROM Offices
		JOIN Employees USING (officeCode)
        JOIN Customers ON Employees.employeeNumber = Customers.salesRepEmployeeNumber
		WHERE Customers.country != Offices.country
        GROUP BY Offices.country) AS TableA);


SELECT customerName, COUNT(DISTINCT orderNumber)
FROM Customers
JOIN Orders USING (customerNumber)
GROUP BY customerName
HAVING COUNT(orderNumber) = (SELECT MAX(numberOfOrders)
FROM(
	SELECT COUNT(DISTINCT orderNumber) AS numberOfOrders
	FROM Customers
	JOIN Orders USING (customerNumber)
	GROUP BY customerName) AS tableA);


SELECT productLine
FROM ProductLines
JOIN Products USING (productLine)
GROUP BY productLine
HAVING COUNT(quantityInStock) = (SELECT MIN(quantityPerLine)
        FROM
        (SELECT COUNT(quantityInStock) AS 'quantityPerLine'
        FROM ProductLines
        JOIN Products USING (productLine)
        GROUP BY productLine) AS TableA);









