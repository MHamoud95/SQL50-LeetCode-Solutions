WITH categories AS (
  SELECT 'Low Salary' AS category
  UNION ALL
  SELECT 'Average Salary'
  UNION ALL
  SELECT 'High Salary'
),
cte as (
select *, case when income < 20000 then 'Low Salary'
                when income >= 20000 and income <= 50000 then 'Average Salary'
                else 'High Salary'
            end as category
from accounts)
select categories.category, count(cte.account_id) as accounts_count
from categories
left join cte 
on cte.category = categories.category
group by 1;

