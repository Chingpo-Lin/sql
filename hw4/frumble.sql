
CREATE TABLE Sales (
   name varchar(10), --A
   discount varchar(10), --B
   month varchar(10), --C
   price int); --D

--(2) summary:
/*
ED holds: A->D, C->B others will be equivalent to these or not holds
*/
-- name -> discount A-B
SELECT *
FROM Sales AS S
GROUP BY S.name
HAVING COUNT(DISTINCT S.discount) > 1
Limit 1;
-- there is output, FD not holds

-- name -> price A-D
SELECT *
FROM Sales AS S
GROUP BY S.name
HAVING COUNT(DISTINCT S.price) > 1
Limit 1;
-- there is no output, FD holds

-- C->B
SELECT *
FROM Sales AS S
GROUP BY S.month
HAVING COUNT(DISTINCT S.discount) > 1
Limit 1;
-- there is no output, FD holds


--(3)
CREATE TABLE R1 (name varchar(10) PRIMARY KEY, price int);
CREATE TABLE R2 (month varchar(10) PRIMARY KEY, discount varchar(10));
CREATE TABLE R3 (name varchar(10) REFERENCES R1, month varchar(10) REFERENCES R2);

--(4)
INSERT INTO R1 SELECT DISTINCT name, price FROM Sales;
INSERT INTO R2 SELECT DISTINCT month, discount FROM Sales;
INSERT INTO R3 SELECT DISTINCT name, month FROM Sales;

SELECT COUNT(*) FROM R1;
SELECT COUNT(*) FROM R2;
SELECT COUNT(*) FROM R3;