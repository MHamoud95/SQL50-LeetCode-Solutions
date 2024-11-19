with cte as (select *, lag(temperature,1) over(order by recorddate) as prev_temp,
lag(recorddate,1) over(order by recorddate) as prev_date
from weather)
select Id 
from cte
where temperature > prev_temp and datediff(recorddate,prev_date) = 1