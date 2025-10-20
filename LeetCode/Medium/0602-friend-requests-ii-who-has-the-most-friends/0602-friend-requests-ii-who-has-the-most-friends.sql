# Write your MySQL query statement below
# Being friends is bidirectional. If you accept someone's adding friend request, both you and the other person will have one more friend.
WITH id_list AS (
   SELECT requester_id AS id 
   FROM RequestAccepted
   UNION ALL
   SELECT accepter_id AS id
   FROM RequestAccepted)

select id,
count(*) as num
from id_list
group by id
order by count(*) desc
limit 1;
