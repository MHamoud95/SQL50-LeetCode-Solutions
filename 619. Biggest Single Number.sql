select if(count(num)>1, null,num) as num
from mynumbers
group by num
order by num desc
limit 1;