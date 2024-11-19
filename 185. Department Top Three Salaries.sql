# Write your MySQL query statement below
with salary_rank as (
select employee.name as employee_name, employee.salary as salary,employee.departmentid, department.name as dept_name,
dense_rank() over(partition by departmentId order by salary desc) as rnk
from employee
join department
on employee.departmentId  = department.id)
select dept_name as Department , employee_name as Employee , salary as Salary
from salary_rank
where rnk <= 3;