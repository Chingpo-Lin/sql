CREATE TABLE Edges (
	Source INT, 
	Destination INT);

INSERT INTO Edges VALUES(10, 5);
INSERT INTO Edges VALUES(6, 25);
INSERT INTO Edges VALUES(1, 3);
INSERT INTO Edges VALUES(4, 4);
INSERT INTO Edges VALUES('-1','2000');
SELECT Source, Destination FROM Edges
SELECT Source FROM Edges
SELECT * FROM Edges WHERE Source > Destination


CREATE TABLE UWRestaurants(
	Name Varchar(50) PRIMARY KEY,
    Food Varchar(50),
	Distance Int, 
	Last_Visit Varchar(50),
	Attitude Int);

INSERT INTO UWRestaurants VALUES('University Kitchen', 'fried chicken', 5, '2020-02-23', 1);
INSERT INTO UWRestaurants VALUES('Hub', 'orange chicken', 4, '2020-02-29', 0);
INSERT INTO UWRestaurants VALUES('Cultivate', 'pork chop', 3, '2020-05-09', 1);
INSERT INTO UWRestaurants VALUES('Local Point', 'husky combo', 2, '2020-09-02', 1);
INSERT INTO UWRestaurants VALUES('Central Table', 'pizza', 1, '2020-03-23', NULL);

.header off
.mode csv
SELECT * FROM UWRestaurants;
.mode list
SELECT * FROM UWRestaurants;
.mode column
.width 15 15 15 15 15
SELECT * FROM UWRestaurants;
SELECT Name, Distance FROM UWRestaurants WHERE Distance <= 20 ORDER by Name;

SELECT * FROM UWRestaurants WHERE Distance <= 10;
SELECT * FROM UWRestaurants WHERE Attitude = 1 AND Last_Visit < Date('now', '-3 month');