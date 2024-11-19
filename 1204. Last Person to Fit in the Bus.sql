# Write your MySQL query statement below
with cte as (
select *,
case when sum(weight) over(order by turn) <= 1000 then 'in' else 'out' end as passanger_status
from queue)
select person_name
from cte 
where passanger_status  = 'in'
order by turn desc
limit 1;