CREATE TABLE CARRIERS (
   cid varchar(7) PRIMARY KEY, 
   name varchar(83)
   );
CREATE TABLE MONTHS (mid int PRIMARY KEY, 
   month varchar(9));
CREATE TABLE WEEKDAYS (did int PRIMARY KEY, 
   day_of_week varchar(9));

CREATE TABLE FLIGHTS (fid int PRIMARY KEY, 
         month_id int REFERENCES MONTHS(mid),       -- 1-12
         day_of_month int,    -- 1-31 
         day_of_week_id int REFERENCES WEEKDAYS(did),  -- 1-7, 1 = Monday, 2 = Tuesday, etc
         carrier_id varchar(7) REFERENCES CARRIERS(cid), 
         flight_num int,
         origin_city varchar(34), 
         origin_state varchar(47), 
         dest_city varchar(34), 
         dest_state varchar(46), 
         departure_delay int, -- in mins
         taxi_out int,        -- in mins
         arrival_delay int,   -- in mins
         canceled int,        -- 1 means canceled
         actual_time int,     -- in mins
         distance int,        -- in miles
         capacity int, 
         price int            -- in $             
         );



CREATE TABLE Team (id int PRIMARY KEY, 
                  name varchar(20),
                  organization varchar(50));

CREATE TABLE Contestant (id int PRIMARY KEY, 
                        tid int REFERENCES Team(id),
                        name varchar(20),
                        birthyear int);

Select Distinct C.name
From Team AS T, Contestant AS C
where T.id = C.tid 
And T.name = 'Track'
And T.organization = 'University of Washington'
Order by C.name

Performance(eid, cid, time, won) // Time in seconds. Won is 0 if lost, 1 if won.
Event(id, mid, name) 
Meet(id, name, year) 

Select Distinct E.id AS Eventid, E.name AS name
From Event AS E, Performance AS P1, Performance AS P2
where E.id = P1.eid 
And E.id = P2.eid
And P1.cid != P2.cid
And P1.won = 1
And P2.won = 1)

Select Distinct E.id AS Eventid, E.name AS name
From Event AS E, Performance AS P
where Sum(P.won) > 1
Group by P.eid, E.id, E.name
Having E.id = P.eid

meet name, meet year, event name, and completion time

Select Distinct M.name, M.year, E.name, P.time
From Meet AS M, Event AS E, Performance AS P
where P.eid = E.id
And E.mid = M.id
And P.won = 1
And P.time <= all (Select P1.time 
                  From Meet AS M1, Performance AS P1
                  where M1.id = M.id)
