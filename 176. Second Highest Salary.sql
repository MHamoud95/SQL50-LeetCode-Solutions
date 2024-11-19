# Write your MySQL query statement below
with ordering_salary as(
select id, salary, 
dense_rank() over(order by salary desc) as rnk
from employee)
select min(if(rnk = 2, salary, null)) as SecondHighestSalary
from ordering_salary;