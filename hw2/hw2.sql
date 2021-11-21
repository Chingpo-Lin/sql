CREATE TABLE CARRIERS (
	cid varchar(7) PRIMARY KEY, 
	name varchar(83)
	);
CREATE TABLE MONTHS (mid int PRIMARY KEY, 
	month varchar(9));
CREATE TABLE WEEKDAYS (did int PRIMARY KEY, 
	day_of_week varchar(9));

CREATE TABLE FLIGHTS (fid int PRIMARY KEY, 
         month_id int REFERENCES MONTHS(mid),       -- 1-12
         day_of_month int,    -- 1-31 
         day_of_week_id int REFERENCES WEEKDAYS(did),  -- 1-7, 1 = Monday, 2 = Tuesday, etc
         carrier_id varchar(7) REFERENCES CARRIERS(cid), 
         flight_num int,
         origin_city varchar(34), 
         origin_state varchar(47), 
         dest_city varchar(34), 
         dest_state varchar(46), 
         departure_delay int, -- in mins
         taxi_out int,        -- in mins
         arrival_delay int,   -- in mins
         canceled int,        -- 1 means canceled
         actual_time int,     -- in mins
         distance int,        -- in miles
         capacity int, 
         price int            -- in $             
         );


.mode csv
.import weekdays.csv WEEKDAYS
.import months.csv MONTHS
.import carriers.csv CARRIERS
.import flights-small.csv FLIGHTS


#q1 3
SELECT Distinct F.flight_num From FLIGHTS AS F, CARRIERS AS C, WEEKDAYS AS W
where F.origin_city = "Seattle WA" And F.dest_city = "Boston MA" And 
C.cid = F.carrier_id And C.name = "Alaska Airlines Inc." And
F.day_of_week_id = W.did And W.day_of_week = "Monday";

#q2 1472
SELECT F1.flight_num AS f1_flight_num, F1.origin_city AS f1_origin_city, F1.dest_city AS f1_dest_city, 
F1.actual_time AS f1_actual_time, F2.flight_num AS f2_flight_num, F2.origin_city AS f2_origin_city, 
F2.dest_city AS f2_dest_city, F2.actual_time AS f2_actual_time, (F1.actual_time + F2.actual_time) AS actual_time
From FLIGHTS AS F1, FLIGHTS AS F2, MONTHS AS M where F1.origin_city = "Seattle WA" And F2.dest_city = "Boston MA" 
And F1.carrier_id = F2.carrier_id And F1.dest_city = F2.origin_city And (F1.actual_time + F2.actual_time) < 420
And F1.month_id = M.mid And F2.month_id = M.mid And F1.day_of_month = 15 And F2.day_of_month = 15 And M.month = "July" ; 

#q3 1
SELECT W.day_of_week AS day_of_week, AVG(F.arrival_delay) AS delay 
From FLIGHTS AS F, WEEKDAYS AS W
where F.day_of_week_id = W.did 
Group by W.day_of_week
ORDER BY delay DESC
Limit 1;

#4
SELECT Distinct C.name AS name From FLIGHTS AS F, CARRIERS AS C
where F.carrier_id = C.cid
Group by C.name, F.day_of_month, F.month_id
Having Count(F.fid) > 1000;

#5
SELECT C.name AS name, (Sum(F.canceled)*100.0/Count(*)) AS percentage  
From FLIGHTS AS F, CARRIERS AS C
where F.carrier_id = C.cid And F.origin_city = "Seattle WA"
Group by C.name
Having percentage > 0.5	
ORDER by percentage;

#6  3
SELECT C.name AS carrier, Max(F.price) AS max_price
From FLIGHTS AS F, CARRIERS AS C
where F.carrier_id = C.cid And (F.origin_city = "Seattle WA" OR F.dest_city = "Seattle WA")
And (F.origin_city = "New York NY" OR F.dest_city = "New York NY")
Group by C.name;

#7
SELECT Sum(F.capacity) AS capacity 
From FLIGHTS AS F, MONTHS AS M
where (F.origin_city = "Seattle WA" OR F.dest_city = "Seattle WA")
And (F.origin_city = "San Francisco CA" OR F.dest_city = "San Francisco CA")
And F.month_id = M.mid And F.day_of_month = 10 And M.month = "July";

#8 22
SELECT C.name AS name, Sum(F.departure_delay) AS delay 
From FLIGHTS AS F, CARRIERS AS C
where C.cid = F.carrier_id
Group by C.name;


# try
SELECT P.Name, max(P.Salary) 
From payroll AS P
Group by P.job

function foo() {
  let bar = function() {
    console.log("1");
    let baz = () => console.log("2");
    return baz;
  }
  setTimeout(bar, 1000);
  console.log("3");
}
foo();