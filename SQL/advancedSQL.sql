USE ClassicModels;

SELECT CASE
			WHEN creditLimit > 150000 THEN "Good"
            WHEN creditLimit < 50000 THEN "Bad"
            ELSE "Average" END AS CreditStanding, COUNT(customerNumber)
FROM Customers
GROUP BY CreditStandin

SELECT customerName,
	CASE
			WHEN creditLimit > 150000 THEN "Good"
            WHEN creditLimit < 50000 THEN "Bad"
            ELSE "Average" END AS CreditStanding
FROM Customers;

SELECT *
FROM Orders;

SELECT DATEDIFF(shippedDate, orderDate)
FROM Orders;

SELECT DISTINCT YEAR(orderDate)
FROM Orders;

SELECT DISTINCT MONTH(orderDate)
FROM Orders;

SELECT DISTINCT DAY(orderDate)
FROM Orders;

SELECT DISTINCT MONTHNAME(orderDate)
FROM Orders;

SELECT DISTINCT dayofweek(orderDate)
FROM Orders;

SELECT CONCAT(ROUND(ST_Distance_Sphere(POINT(72.877,19.076), POINT(-74.006,40.712))/1000,2)," KM");

USE Geography;

SELECT *
FROM political_unit;

SELECT *
FROM city;

SELECT *
FROM boundary;

SELECT unitname, ST_Area(boundpath) * 37.5*37.5
FROM political_unit
JOIN boundary USING (unitcode)
WHERE unitname = 'Republic of Ireland';

SELECT ST_Distance(start.cityloc, end.cityloc)*37.5
FROM city AS start, city AS end
WHERE start.cityname = "Dublin" AND end.cityname = "Cork";









