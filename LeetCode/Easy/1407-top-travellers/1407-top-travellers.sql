# Write your MySQL query statement below
select name, 
COALESCE(SUM(Rides.distance), 0) travelled_distance  # provide a default or fallback value when NULL values are encountered in the data
from Users
left join Rides  # 确保即便某些用户没有任何乘车记录也能出现在结果
on Users.id = Rides.user_id
group by user_id
order by travelled_distance desc, name asc;