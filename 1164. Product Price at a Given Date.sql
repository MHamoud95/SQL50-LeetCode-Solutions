-- Get the latest price on or before '2019-08-16'
select product_id, new_price as price
from products
where (product_id, change_date) in 
    (select product_id, max(change_date)
     from products
     where change_date <= '2019-08-16'
     group by product_id)

union

-- Assign price 10 for products that have no price changes before '2019-08-16'
select distinct product_id, 10 as price
from products
where product_id not in 
    (select product_id from products where change_date <= '2019-08-16')
