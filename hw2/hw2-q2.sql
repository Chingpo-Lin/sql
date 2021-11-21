-- 1472 rows output
SELECT F1.flight_num AS f1_flight_num, F1.origin_city AS f1_origin_city, F1.dest_city AS f1_dest_city, 
F1.actual_time AS f1_actual_time, F2.flight_num AS f2_flight_num, F2.origin_city AS f2_origin_city, 
F2.dest_city AS f2_dest_city, F2.actual_time AS f2_actual_time, (F1.actual_time + F2.actual_time) AS actual_time
From FLIGHTS AS F1, FLIGHTS AS F2, MONTHS AS M where F1.origin_city = "Seattle WA" And F2.dest_city = "Boston MA" 
And F1.carrier_id = F2.carrier_id And F1.dest_city = F2.origin_city And (F1.actual_time + F2.actual_time) < 420
And F1.month_id = M.mid And F2.month_id = M.mid And F1.day_of_month = 15 And F2.day_of_month = 15 And M.month = "July" ; 