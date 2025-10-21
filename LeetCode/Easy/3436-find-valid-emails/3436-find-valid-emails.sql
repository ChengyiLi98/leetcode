# Write your MySQL query statement below
select user_id,email
from Users
WHERE email REGEXP '^[A-Za-z0-9_]+@[A-Za-z]+\\.com$'
# ^ 1. 匹配输入字符串的开始位置 
# 2. 当该符号在方括号表达式中使用时，表示不接受该方括号表达式中的字符集合。
# $ 匹配输入字符串的结尾位置

# 在正则里 \. 的确是“匹配一个点，但MySQL把字符串（例如 '\\.com'）先作为普通 SQL 字符串解析，然后再传给正则引擎。