-- 1 row output
SELECT W.day_of_week AS day_of_week, AVG(F.arrival_delay) AS delay 
From FLIGHTS AS F, WEEKDAYS AS W
where F.day_of_week_id = W.did 
Group by W.day_of_week
ORDER BY delay DESC
Limit 1;