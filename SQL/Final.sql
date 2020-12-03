USE Text;

#1
SELECT
	SUM(CASE WHEN (deptfloor = 1 OR deptfloor = 2) THEN saleqty END) AS "Sales of products on Floors 1 and 2",
    SUM(CASE WHEN (deptfloor = 3 OR deptfloor = 4 OR deptfloor = 5) THEN saleqty END) AS "Sales of products on Floors 3, 4, and 5"
FROM qdept
JOIN qsale USING (deptname);

#2
SELECT splname, COUNT(delno)
FROM qspl
JOIN qdel USING (splno)
WHERE delqty > (SELECT AVG(delqty) FROM qdel WHERE qspl.splno = qdel.splno)
GROUP BY splname;

#3
SELECT emp.empfname AS "worker" , boss.empfname AS "boss"
FROM qemp AS boss
JOIN qemp AS emp ON boss.empno = emp.bossno
WHERE boss.empsalary > (2 * emp.empsalary) AND emp.deptname = boss.deptname;


#4
SELECT qitem.itemname, SUM(delqty)
FROM qitem
JOIN qdel ON qitem.itemname = qdel.itemname
JOIN qspl ON qdel.splno = qdel.splno
WHERE qspl.splno != 102
GROUP BY qitem.itemname;

#5
SELECT qemp.deptname, AVG(empsalary)
FROM qdept
JOIN qemp ON qdept.deptname = qemp.deptname
GROUP BY qemp.deptname
HAVING AVG(empsalary) = (SELECT MIN(minSalary)
	FROM(
	SELECT AVG(empsalary) AS minSalary
	FROM qdept
	JOIN qemp ON qdept.deptname = qemp.deptname
	GROUP BY qdept.deptname)tableA);