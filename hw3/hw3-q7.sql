-- 4 rows output 
-- the query took 1 seconds

SELECT Distinct C.name AS carrier
From FLIGHTS AS F, CARRIERS AS C
where F.carrier_id = C.cid
And F.origin_city = 'Seattle WA'
And F.dest_city = 'San Francisco CA'
Order by C.name;

/* first 20 rows
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/