# Write your MySQL query statement below
select signups.user_id as user_id,
ifnull(round(sum(case when action = 'timeout' then 0 else 1 end ) / count(action),2),0) as confirmation_rate
from signups
left join Confirmations 
on signups.user_id = Confirmations.user_id
group by signups.user_id
