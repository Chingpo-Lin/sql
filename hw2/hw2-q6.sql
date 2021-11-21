-- 3 rows output
SELECT C.name AS carrier, Max(F.price) AS max_price
From FLIGHTS AS F, CARRIERS AS C
where F.carrier_id = C.cid And (F.origin_city = "Seattle WA" OR F.dest_city = "Seattle WA")
And (F.origin_city = "New York NY" OR F.dest_city = "New York NY")
Group by C.name;