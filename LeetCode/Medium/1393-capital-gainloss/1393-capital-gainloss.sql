
/*
# first attempt
with buy_table as
(select stock_name,sum(price) as buy
from Stocks
where operation = 'Buy'
group by stock_name),
sell_table as
(select stock_name,sum(price) as sell
from Stocks
where operation = 'Sell'
group by stock_name)

select b.stock_name,
(s.sell-b.buy) as capital_gain_loss
from buy_table b
join sell_table s
using (stock_name)
group by stock_name;
*/
SELECT
  stock_name,
  SUM(CASE WHEN operation = 'Sell' THEN price ELSE -price END) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;



