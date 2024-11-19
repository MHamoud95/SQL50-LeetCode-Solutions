# Write your MySQL query statement below

with user_rating as(
    select u.name as name, count(m.rating) as rating_count
    from movierating m
    join users u
    on m.user_id = u.user_id
    group by 1
    order by 2 desc,1
    limit 1),
highest_average as(
    select m.title as title, avg(rating) as avg_rating
    from movierating r
    join movies m
    on r.movie_id = m.movie_id
    where extract(month from created_at ) = 2 and extract(year from created_at ) = 2020
    group by 1
    order by 2 desc, 1
    limit 1)
    
select name as results from user_rating
union all
select title from highest_average