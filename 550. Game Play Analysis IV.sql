with next_login as (SELECT 
    player_id, event_date, 
    LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS next_login_date,
    row_number() OVER (PARTITION BY player_id ORDER BY event_date) as rn
FROM 
    activity)

select round(sum(case when datediff(next_login_date,event_date) = 1 then 1 else 0 end) / 
(select count(distinct player_id) * 1.0 from activity),2) as fraction
from next_login
where rn = 1