# Write your MySQL query statement below

# name of the user who has rated the greatest number of movies
(select u.name as results
from Users u
join MovieRating mr
on u.user_id = mr.user_id
group by mr.user_id
order by count(*) desc, u.name asc
limit 1) union all # UNION will remove duplicates

(select m.title as results
from Movies m
join MovieRating mr2
on m.movie_id = mr2.movie_id
WHERE mr2.created_at LIKE '2020-02%' # WHERE DATE_FORMAT(mr2.created_at, '%Y-%m') = '2020-02'
group by mr2.movie_id
order by avg(mr2.rating) desc, m.title asc
limit 1) 
;

