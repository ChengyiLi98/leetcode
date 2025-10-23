# Write your MySQL query statement below

select p.product_id,
IFNULL(round(sum(us.units * p.price)/sum(us.units), 2),0) average_price
from Prices p
left join UnitsSold us
on p.product_id = us.product_id 
and us.purchase_date BETWEEN p.start_date AND p.end_date
group by p.product_id

# 当你使用 LEFT JOIN 时，右表 (UnitsSold) 里匹配不到的数据会生成一行全是 NULL 的行。
# 但是！如果你在 WHERE 子句里加上 us.purchase_date BETWEEN ... 这种条件，这些 NULL 行会被过滤掉，因为：
# WHERE NULL BETWEEN p.start_date AND p.end_date → 结果是 UNKNOWN → 被排除
# → 所以你的查询效果等价于 INNER JOIN。

# 正确做法是把日期条件写进 ON 子句里，让它只影响匹配，而不影响左表的保留
