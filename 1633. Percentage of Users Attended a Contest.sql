select contest_id, round(count(user_id) /(select count(*) from Users)* 100,2) as percentage
from register
group by 1 
order  by percentage desc, contest_id asc
