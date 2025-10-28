# Write your MySQL query statement below

# We “remap” each row’s id in the SELECT list: odd ids jump to the next id, even ids move back one, and the final odd id (when there’s no partner) stays put. Ordering by the new id gives the swapped seating.

# MAX(id) 是一个聚合函数，它会对整张表进行聚合（不分组时就是整表）。
# 即使用了group by id，也变成了对每一组（每一个id）取的 MAX
# 于是数据库认为整个查询只需要输出一个汇总结果，这就是为什么你只得到了一行。
# 要让每一行都能看到全表的最大 id，你需要先单独计算 MAX(id)，再在主查询里引用。
SELECT
  CASE
    WHEN id % 2 = 1 AND id <> (SELECT MAX(id) FROM Seat) THEN id + 1
    WHEN id % 2 = 0 THEN id - 1
    ELSE id
  END AS id,
  student
FROM Seat
ORDER BY id;
