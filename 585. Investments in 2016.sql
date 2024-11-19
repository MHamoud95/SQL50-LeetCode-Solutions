# Write your MySQL query statement below
with cte as(
select distinct a.pid, a.tiv_2016 as tiv_2016
from Insurance  a
join Insurance  b
on a.tiv_2015 = b.tiv_2015 and a.pid <> b.pid 
where (a.lat,a.lon) not in (
    select lat,lon from Insurance 
    group by 1,2
    having count(*) > 1
))
select round(sum(tiv_2016),2 ) as tiv_2016 
from cte


