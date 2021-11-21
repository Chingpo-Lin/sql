-- 256 rows output
-- the query took 74 seconds

SELECT Distinct F2.dest_city AS city
From FLIGHTS AS F1, FLIGHTS AS F2
where F1.dest_city = F2.origin_city 
And F1.origin_city = 'Seattle WA' 
And F2.dest_city != F1.origin_city
And F2.dest_city Not IN (SELECT F3.dest_city
						From FLIGHTS AS F3
						where F3.origin_city = 'Seattle WA')
ORDER BY city;

/* first 20 rows
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlantic City NJ
Augusta GA
Bakersfield CA
Bangor ME
*/
