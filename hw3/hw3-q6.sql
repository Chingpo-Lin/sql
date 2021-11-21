-- 4 rows output 
-- the query took 1 seconds

SELECT Distinct C.name AS carrier
From CARRIERS AS C, (SELECT F.carrier_id
					From FLIGHTS AS F
					where F.origin_city = 'Seattle WA'
					And F.dest_city = 'San Francisco CA') AS F
where F.carrier_id = C.cid
Order by C.name;

/* first 20 rows
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/
