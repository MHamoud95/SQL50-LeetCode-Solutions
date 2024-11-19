select mang.employee_id, mang.name,count(emp.employee_id) as reports_count, round(avg(emp.age),0) as average_age
from employees emp
join employees mang
on emp.reports_to = mang.employee_id 
group by 1,2
order by 1