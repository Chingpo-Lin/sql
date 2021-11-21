-- 334 rows output
-- the query took 52 seconds

SELECT F1.origin_city AS origin_city, F1.dest_city AS dest_city, Max(F2.actual_time) AS time
From FLIGHTS AS F1, FLIGHTS AS F2
Group by F2.origin_city, F1.origin_city, F1.actual_time, F1.dest_city
Having F2.origin_city = F1.origin_city And F1.actual_time = Max(F2.actual_time)
Order by F1.origin_city, F1.dest_city;

/* first 20 rows
1 Aberdeen SD  Minneapolis MN 106
2 Abilene TX Dallas/Fort Worth TX 111
3 Adak Island AK Anchorage AK 471
4 Aguadilla PR New York NY 368
5 Akron OH Atlanta GA 408
6 Albany GA Atlanta GA 243
7 Albany NY Atlanta GA 390
8 Albuquerque NM Houston TX 492
9 Alexandria LAAtlanta GA 391
10 Allentown/Bethlehem/Easton PA Atlanta GA 456
11 Alpena MI Detroit MI 80
12 Amarillo TX Houston TX 390
13 Anchorage AK Barrow AK 490
14 Appleton WI Atlanta GA 405
15 Arcata/Eureka CA San Francisco CA 476
16 Asheville NC Chicago IL 279
17 Ashland WV Cincinnati OH 84
18 Aspen CO Los Angeles CA 304
19 Atlanta GA Honolulu HI 649
20 Atlantic City NJ Fort Lauderdale FL 212
*/