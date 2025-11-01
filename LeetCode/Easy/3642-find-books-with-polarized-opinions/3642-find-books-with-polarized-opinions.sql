# Write your MySQL query statement below
select b.book_id,
b.title,
b.author,
b.genre,
b.pages,
(MAX(r.session_rating) - MIN(r.session_rating)) as rating_spread,
round((sum(case when r.session_rating>= 4 or r.session_rating <=2 then 1 else 0 end) 
/NULLIF(COUNT(*), 0)), 2) as polarization_score
from books b
join reading_sessions r
using (book_id)
group by b.book_id
having count(*)>=5
and MAX(r.session_rating) >= 4
and MIN(r.session_rating) <= 2
and polarization_score >= 0.6
order by polarization_score desc, b.title desc;


