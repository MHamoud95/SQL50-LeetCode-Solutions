# Write your MySQL query statement below
select products.product_name as product_name, sum(unit) as unit
from orders
join products
on orders.product_id = products.product_id
where extract(month from order_date) = 2 and extract(year from order_date) = 2020
group by products.product_name
having sum(unit) >= 100
