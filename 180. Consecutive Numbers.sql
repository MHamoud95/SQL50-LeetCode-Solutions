with cte as (select case
            when lead(num) over(order by id) = num
            and lead(num,2) over(order by id) = num
            and lead(id) over(order by id) = id+1
            and lead(id,2) over(order by id) = id+2
            then num
        end as ConsecutiveNums
from logs)
select distinct ConsecutiveNums
from cte
where ConsecutiveNums is not null;