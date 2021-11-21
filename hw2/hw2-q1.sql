-- 3 rows output
SELECT Distinct F.flight_num From FLIGHTS AS F, CARRIERS AS C, WEEKDAYS AS W
where F.origin_city = "Seattle WA" And F.dest_city = "Boston MA" And 
C.cid = F.carrier_id And C.name = "Alaska Airlines Inc." And
F.day_of_week_id = W.did And W.day_of_week = "Monday";