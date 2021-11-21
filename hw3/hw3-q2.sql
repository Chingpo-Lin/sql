-- 109 rows output
-- the query took 12 seconds

SELECT Distinct F1.origin_city AS city 
From FLIGHTS AS F1
where 180 > all(SELECT Max(F2.actual_time)
					From Flights AS F2
					where F2.canceled = 0
		   			And F2.origin_city = F1.origin_city
		   			Group by F2.origin_city)
Order by F1.origin_city;

/* first 20 rows
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
*/