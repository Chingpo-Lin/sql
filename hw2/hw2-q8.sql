-- 22 rows output
SELECT C.name AS name, Sum(F.departure_delay) AS delay 
From FLIGHTS AS F, CARRIERS AS C
where C.cid = F.carrier_id
Group by C.name;