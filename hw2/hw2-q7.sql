-- 1 row output
SELECT Sum(F.capacity) AS capacity 
From FLIGHTS AS F, MONTHS AS M
where (F.origin_city = "Seattle WA" OR F.dest_city = "Seattle WA")
And (F.origin_city = "San Francisco CA" OR F.dest_city = "San Francisco CA")
And F.month_id = M.mid And F.day_of_month = 10 And M.month = "July";