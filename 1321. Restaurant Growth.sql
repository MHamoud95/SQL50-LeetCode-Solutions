WITH rolling_data AS (
    SELECT visited_on,
           SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS rolling_sum,
           SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) / 7 AS rolling_avg
    FROM customer
)
SELECT DISTINCT visited_on, 
                rolling_sum AS amount, 
                ROUND(rolling_avg, 2) AS average_amount
FROM rolling_data
WHERE visited_on >= (SELECT MIN(visited_on) + INTERVAL 6 DAY FROM customer)
ORDER BY visited_on;
