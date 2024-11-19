with cte as (
select machine_id,process_id, activity_type, timestamp,
lead(timestamp) over(partition by machine_id, process_id order by timestamp) as end_type
from activity
)
select machine_id, round(sum(end_type - timestamp) / count( distinct process_id),3) as processing_time
from cte 
where end_type is not null
group by machine_id