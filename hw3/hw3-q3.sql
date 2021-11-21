-- 327 rows output
-- the query took 25 seconds

SELECT F1.origin_city AS origin_city, ISNULL(F2.count * 100.0 / count(F1.origin_city), 0) AS percentage
From FLIGHTS AS F1 Left Outer Join (SELECT F.origin_city, count(*) AS count
									From FLIGHTS AS F 
									where F.actual_time < 180
									And F.canceled = 0
									Group by F.origin_city) AS F2
On F1.origin_city = F2.origin_city
where F1.canceled = 0
Group by F1.origin_city, F2.count
Order by percentage, origin_city

/* first 20 rows (two rows is a row of output)
Guam TT
0.000000000000
Pago Pago TT
0.000000000000
Aguadilla PR
28.897338403041
Anchorage AK
31.812080536912
San Juan PR
33.660531697341
Charlotte Amalie VI
39.558823529411
Ponce PR
40.983606557377
Fairbanks AK
50.116550116550
Kahului HI
53.514471352628
Honolulu HI
54.739028823682
San Francisco CA
55.828864537188
Los Angeles CA
56.080890822987
Seattle WA
57.609387792231
Long Beach CA
62.176439513998
New York NY
62.371834136728
Kona HI
63.160792951541
Las Vegas NV
64.920256372037
Christiansted VI
65.100671140939
Newark NJ
65.849971096980
Plattsburgh NY
66.666666666666
*/