select p.product_id, ifnull(round(sum(price * units) / sum(units),2),0) as average_price
from prices p 
left join unitssold s 
on p.product_id = s.product_id 
and s.purchase_date BETWEEN p.start_date AND p.end_date
group by product_id