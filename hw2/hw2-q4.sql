-- 12 rows output
SELECT Distinct C.name AS name From FLIGHTS AS F, CARRIERS AS C
where F.carrier_id = C.cid
Group by C.name, F.day_of_month, F.month_id
Having Count(F.fid) > 1000;