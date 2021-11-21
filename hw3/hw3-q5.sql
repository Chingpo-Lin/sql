-- 3 rows output 
-- the query took 161 seconds

SELECT Distinct F1.dest_city AS city
From FLIGHTS AS F1
where F1.dest_city Not IN (SELECT F2.dest_city
							From FLIGHTS AS F2
							where F2.origin_city = 'Seattle WA')
And F1.dest_city Not IN (SELECT F3.dest_city
							From FLIGHTS AS F4, FLIGHTS AS F3
							where F4.dest_city = F3.origin_city
							And F4.origin_city = 'Seattle WA')
Order by F1.dest_city;

/* first 20 rows
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
*/
