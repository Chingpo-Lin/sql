-- 6 rows output
SELECT C.name AS name, (Sum(F.canceled)*100.0/Count(*)) AS percentage  
From FLIGHTS AS F, CARRIERS AS C
where F.carrier_id = C.cid And F.origin_city = "Seattle WA"
Group by C.name
Having percentage > 0.5	
ORDER by percentage;