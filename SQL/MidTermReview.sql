# PRACTICE FOR EXAM 1

USE ClassicModels;

#1.1
SELECT productName, productCode
FROM Products
WHERE quantityInStock < 100;

#1.2
SELECT *
FROM Products
WHERE productLine REGEXP("vintage cars|planes|trains")
ORDER BY productCode;

#1.3
SELECT AVG(MSRP), AVG(quantityInStock)
FROM Products
WHERE productLine = "motorcycles";

#1.4
SELECT COUNT(*)
FROM Products
WHERE productLine IN("vintage cars","planes") AND quantityInStock < 200;

#1.5
SELECT productCode, MSRP*1.1
FROM Products
ORDER BY MSRP*1.1 DESC;

#1.6
SELECT MIN(MSRP), MAX(MSRP)
FROM Products
WHERE productCode REGEXP"^S18";

#1.7
SELECT productCode, productName
FROM Products
WHERE productName REGEXP "Special" AND buyPrice < 100;

#1.8
SELECT COUNT(*)
FROM Products
WHERE buyPrice  > (SELECT AVG(buyPrice) FROM Products);

#1.9
SELECT productName, productCode, productVendor
FROM Products
WHERE MSRP BETWEEN 100 AND 200
ORDER BY productVendor DESC, productCode;

#1.10
SELECT productCode, productLine, productName, MSRP
FROM Products
WHERE MSRP < (SELECT MIN(MSRP) FROM Products WHERE productLine = "Planes");

USE ns_tpl07650;
#2.1
INSERT INTO PRODUCT_COST
	VALUES('Depreciation','1002','Fixed',20000);
INSERT INTO PRODUCT_COST
	VALUES('Salaries','1003','Hybrid',25000);
INSERT INTO PRODUCT_COST
	VALUES('Property taxes','1004','Fixed',38000);
INSERT INTO PRODUCT_COST
	VALUES('Direct labor','1005','Variable',69000);

#2.2
SELECT COUNT(*)
FROM PRODUCT_COST;
SELECT COUNT(*)
FROM PRODUCT_COST
WHERE PC_DESC IS NULL;

#2.3
UPDATE PRODUCT_COST
SET PC_DESC = 'Direct expenses'
WHERE PC_DESC IS NULL;

#2.4
SELECT DISTINCT PC_TYPE
FROM PRODUCT_COST
WHERE PC_TYPE != "Hybrid";

#2.5
SELECT PC_DESC
FROM PRODUCT_COST
WHERE PC_DESC NOT IN("Depreciation","Direct Labor");

#2.6
SELECT COUNT(*)
FROM PRODUCT_COST
WHERE PC_AMOUNT > (SELECT AVG(PC_AMOUNT) FROM PRODUCT_COST);

#2.7
SELECT PC_CODE, PC_DESC
FROM PRODUCT_COST
WHERE PC_AMOUNT BETWEEN 35000 AND 50000 AND PC_CODE REGEXP("0");

#2.8
DELETE FROM PRODUCT_COST
WHERE PC_TYPE = "Hybrid";

#2.9
USE ns_tpl07650;
CREATE TABLE PROJECT ( 
P_Name VARCHAR(20), 
P_Number VARCHAR(6)  NOT NULL,  
 P_Manager VARCHAR(6), 
 P_Act_Cost INTEGER, 
 P_Exp_Cost INTEGER, 
 PRIMARY KEY(P_Number), FOREIGN KEY(P_Manager) REFERENCES MANAGER(Mg_Number));
 
SELECT *
FROM PROJECT;
 
#2.11
SELECT P_Name, P_Exp_Cost
FROM PROJECT
WHERE P_Exp_Cost > (SELECT AVG(P_Exp_Cost) FROM PROJECT);
 
#2.12
SELECT AVG(P_Exp_Cost)
FROM MANAGER
JOIN PROJECT ON MANAGER.Mg_Number = PROJECT.P_Manager
WHERE Mg_Name = "Yates";

#2.13
SELECT SUM(P_Act_Cost)
FROM MANAGER
JOIN PROJECT ON MANAGER.Mg_Number = PROJECT.P_Manager
WHERE Mg_Name = "Kanter" AND P_Act_Cost < P_Exp_Cost;

#2.14
SELECT P_Number, P_Name
FROM PROJECT
WHERE 1.25* P_Exp_Cost <= P_Act_Cost;

#2.15
SELECT Mg_Department, COUNT(P_Number)
FROM MANAGER
JOIN PROJECT ON MANAGER.Mg_Number = PROJECT.P_Manager
WHERE Mg_Department != "Accounting"
GROUP BY Mg_Department;

#2.16
SELECT Mg_Name, Mg_Number, SUM(P_Exp_Cost)
FROM MANAGER
JOIN PROJECT ON MANAGER.Mg_Number = PROJECT.P_Manager
GROUP BY Mg_Number
HAVING MIN(P_Exp_Cost) >= 1000
ORDER BY Mg_Name DESC;

#2.18
SELECT Mg_Name, Mg_Number, P_Name
FROM MANAGER
JOIN PROJECT
ON MANAGER.Mg_Number = PROJECT.P_Manager
AND P_Act_Cost > (SELECT MIN(P_Act_Cost) FROM PROJECT WHERE MANAGER.Mg_Number = PROJECT.P_Manager);



#3.1
CREATE TABLE WORKER( 
w_id     CHAR(6), 
w_l_name VARCHAR(25),   
w_hrly_rate     DECIMAL(5,2), 
w_skill_type   VARCHAR(20), 
PRIMARY KEY(w_id));

CREATE TABLE BUILDING( bldg_id CHAR(6), 
bldg_address   VARCHAR(35),   
bldg_type VARCHAR(20),   
bldg_qlty_lv    VARCHAR(3), 
PRIMARY KEY(bldg_id));

CREATE TABLE ASSIGNMENT ( 
asg_w_id    CHAR(6), 
asg_bldg_id     CHAR(6), 
asg_st_date       DATE, 
asg_num_days  INT, 
PRIMARY KEY(asg_w_id, asg_bldg_id), 
FOREIGN KEY(asg_w_id) REFERENCES WORKER(w_id), 
FOREIGN KEY(asg_bldg_id) REFERENCES BUILDING(bldg_id));



SELECT DISTINCT w_l_name, w_hrly_rate * 36 AS "Weekly Rate"
FROM WORKER
JOIN ASSIGNMENT ON WORKER.w_id = ASSIGNMENT.asg_w_id
WHERE w_skill_type = "Electric";

#3.2
SELECT w_l_name, w_skill_type
FROM WORKER
JOIN ASSIGNMENT ON WORKER.w_id = ASSIGNMENT.asg_w_id
WHERE asg_bldg_id = "B235";

#3.3
SELECT MIN(w_hrly_rate), MAX(w_hrly_rate)
FROM WORKER;

#4

CREATE TABLE ATHLETE (
Ath_Id    VARCHAR(5) ,  
Ath_F_Nm  VARCHAR(25) ,  
Ath_L_Nm VARCHAR(25),     
Ath_Status CHAR(2), 
Ath_Mentor VARCHAR(5) ,  
Ath_Team_Id CHAR(5),
PRIMARY KEY(Ath_Id));

CREATE TABLE TEAM (        
Team_Id             CHAR(5), 
Team_Nm  VARCHAR(35) ,  
Team_Cost INTEGER,  
Team_Level CHAR(2), 
Team_Counter CHAR(5), 
Team_Captain VARCHAR(5), 
PRIMARY KEY(Team_Id));

ALTER TABLE ATHLETE ADD FOREIGN KEY (Ath_Mentor) REFERENCES ATHLETE(Ath_Id);
ALTER TABLE ATHLETE ADD FOREIGN KEY (Ath_Team_Id) REFERENCES TEAM(Team_Id);
ALTER TABLE TEAM ADD FOREIGN KEY (Team_Captain) REFERENCES ATHLETE(Ath_Id);
ALTER TABLE TEAM ADD FOREIGN KEY (Team_Counter) REFERENCES TEAM(Team_Id);

#4.1
SELECT DISTINCT Senior.Ath_Id, Senior.Ath_F_Nm, Senior.Ath_F_Nm
FROM ATHLETE AS Senior
JOIN ATHLETE AS Junior ON Senior.Ath_Id = Junior.Ath_Mentor
WHERE Senior.Ath_Status = "S" AND Junior.Ath_Status = "J";

#4.2
SELECT team.Team_Id, team.Team_Nm
FROM TEAM AS team
JOIN TEAM AS counter ON team.team_Id = counter.team_Counter
WHERE team.Team_Id REGEXP "^F" AND team.Team_Cost > counter.Team_Cost AND team.Team_Level = "R";

USE ns_tpl07650;

#4.3
SELECT DISTINCT MENTOR.Ath_Id, MENTOR.Ath_L_Nm
FROM ATHLETE AS MENTOR
JOIN ATHLETE AS MENTEE ON MENTOR.Ath_Id = MENTEE.Ath_Mentor
JOIN TEAM ON MENTOR.Ath_Team_Id = Team_Id
WHERE Team_Level = "R";



#4.4
SELECT MENTEE.Ath_Id, MENTEE.Ath_F_Nm, MENTEE.Ath_L_Nm
FROM ATHLETE AS MENTEE
JOIN ATHLETE AS MENTOR ON MENTEE.Ath_Mentor = MENTOR.Ath_Id
JOIN TEAM ON MENTEE.Ath_Id = TEAM.Team_Captain
WHERE MENTOR.Ath_F_Nm = "Andy" AND MENTOR.Ath_L_Nm = "Abad"
ORDER BY Ath_L_Name DESC,Ath_Id;

#4.5
SELECT Team_Id, Team_Nm, Team_Level
FROM TEAM
WHERE (Team_Level = "R" AND Team_Cost < 60) OR (Team_Level = "C" AND Team_Cost < 100);

#4.6
SELECT COMP.Team_Id, COMP.Team_Nm
FROM TEAM AS REC
JOIN TEAM AS COMP ON REC.Team_Id = COMP.Team_Counter
JOIN ATHLETE ON REC.Team_Captain = ATHLETE.Ath_Id
WHERE Ath_Status = "S"
AND COMP.Team_Level = "C"
AND REC.Team_Level = "R";


#5.1
CREATE TABLE DEPARTMENT (        
deptID VARCHAR(5) ,  
deptName  VARCHAR(35) ,  
PRIMARY KEY(deptID));

CREATE TABLE COURSE (        
courseID VARCHAR(10) ,  
courseDesc      VARCHAR(35) ,  
courseCredit    INTEGER(1),     
PRIMARY KEY(courseID));

CREATE TABLE OFFERING (        
DeptID VARCHAR(5), 
CourseID VARCHAR(10) ,  
PRIMARY KEY(DeptID, CourseID));

ALTER TABLE OFFERING  ADD FOREIGN KEY (DeptID) REFERENCES DEPARTMENT(deptID); 
ALTER TABLE OFFERING ADD FOREIGN KEY (CourseID) REFERENCES COURSE(courseID);

CREATE TABLE PREREQ (        
courseID          VARCHAR(10), 
prereqID  VARCHAR(10),
duration_validity  INTEGER,  
PRIMARY KEY(courseID, prereqID));

ALTER TABLE PREREQ ADD FOREIGN KEY (courseID) REFERENCES COURSE(CourseId); 
ALTER TABLE PREREQ ADD FOREIGN KEY (prereqID) REFERENCES COURSE(CourseId);

#5.1
SELECT prereqID
FROM PREREQ
JOIN COURSE ON PREREQ.courseID = COURSE.courseID
WHERE COURSE.courseDesc = "Corporate Fin";

#5.2
SELECT P.courseDesc
FROM COURSE C
JOIN PREREQ ON C.courseID = PREREQ.courseID
JOIN COURSE P ON PREREQ.prereqID = P.courseID
WHERE C.courseDesc = "FINANCE2";

#5.3
SELECT C.courseDesc, C.courseCredit
FROM COURSE C
JOIN PREREQ ON C.courseID = PREREQ.courseID
JOIN COURSE P ON PREREQ.prereqID = P.courseID
WHERE P.courseDesc = "FINANCE2";

#5.4
SELECT deptName
FROM DEPARTMENT
WHERE NOT EXISTS (SELECT * FROM OFFERING WHERE DEPARTMENT.DeptID = OFFERING.DeptID);

#5.5
SELECT courseDesc, COUNT(deptID)
FROM COURSE
JOIN OFFERING ON COURSE.courseID = OFFERING.courseID
GROUP BY courseDesc
HAVING COUNT(deptID) >=2;

#5.6 - NOT RIGHT
SELECT C.courseDesc
FROM COURSE C
JOIN PREREQ ON C.courseID = PREREQ.courseID
JOIN COURSE P ON PREREQ.prereqID = P.courseID
WHERE C.courseDesc REGEXP "Finance" AND NOT EXISTS (SELECT COURSEID FROM PREREQ);

#5.7
SELECT DISTINCT C.courseDesc
FROM COURSE C
JOIN PREREQ ON C.courseID = PREREQ.courseID
JOIN COURSE P ON PREREQ.prereqID = P.courseID
WHERE P.courseCredit > 3;


#MIDTERM SHIT AGAIN
USE ClassicModels;

SELECT customerName
FROM Customers
WHERE NOT EXISTS (SELECT checkNumber FROM Payments WHERE Customers.customerNumber = Payments.customerNumber);

SELECT customerName, COUNT(checkNumber)
FROM Customers
JOIN Payments ON Customers.customerNumber = Payments.customerNumber
WHERE amount > (SELECT AVG(amount) FROM Payments WHERE Customers.customerNumber = Payments.customerNumber)
GROUP BY customerName;

SELECT productName, MSRP - buyPrice AS Margin
FROM Products
WHERE MSRP-buyPrice > (SELECT AVG(MSRP-buyPrice) FROM Products)
ORDER BY Margin;

SELECT AVG(MSRP-buyPrice) FROM Products;

SELECT customerName
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
WHERE country = "Italy" AND priceEach > 200;

SELECT customerName, COUNT(checkNumber)
FROM Customers
JOIN Payments ON Customers.customerNumber = Payments.customerNumber
WHERE country = "USA"
AND amount > 20000
GROUP BY customerName
HAVING COUNT(checkNumber) > 5;

SELECT productName, COUNT(DISTINCT customerNumber)
FROM Products
JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
JOIN Orders ON OrderDetails.orderNumber = Orders.orderNumber
WHERE productLine = "Motorcycles"
GROUP BY productName
HAVING COUNT(DISTINCT customerNumber) > 25
AND SUM(quantityOrdered*priceEach)>100000;

SELECT ProductLines.productLine, COUNT(productCode)
FROM ProductLines 
JOIN Products ON ProductLines.productLine = Products.productLine
WHERE MSRP > (SELECT 1.5 * AVG(MSRP) FROM Products WHERE Products.productLine = ProductLines.productLine)
GROUP BY ProductLines.productLine
HAVING COUNT(productCode) >= 2;

USE Text;
SELECT curr.Party, COUNT(*)
FROM uspresidents AS curr
JOIN uspresidents AS prev ON curr.Predecessor = prev.Presidency
WHERE curr.Party = prev.Party
GROUP BY curr.Party;

USE ClassicModels;

SELECT lastname, firstname
FROM Employees
WHERE reportsTo  = (SELECT employeeNumber FROM Employees WHERE lastname = "Patterson" AND firstname = "Mary");

SELECT productName, COUNT(DISTINCT Products.productCode)
FROM Products
JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
WHERE (quantityOrdered* priceEach)/(SELECT SUM(quantityOrdered * priceEach) FROM Products WHERE Products.productCode = OrderDetails.productCode) > .5
GROUP BY productName;
#HAVING COUNT(DISTINCT Products.productCode) > 2;

#Error Code: 1052. Column 'productCode' in field list is ambiguous



#MIDTERM PRACTICE
USE ClassicModels;

SELECT customerName
FROM Customers
WHERE NOT EXISTS(SELECT * FROM Payments WHERE Customers.customerNumber = Payments.customerNumber);

SELECT customerName, COUNT(checkNumber)
FROM Customers
JOIN Payments ON Customers.customerNumber = Payments.customerNumber
WHERE amount > (SELECT AVG(amount) FROM Payments WHERE Customers.customerNumber = Payments.customerNumber)
GROUP BY customerName;

SELECT productName, MSRP-buyPrice AS Margin
FROM Products
WHERE MSRP-buyPrice > (SELECT AVG(MSRP-buyPrice) FROM Products);

















