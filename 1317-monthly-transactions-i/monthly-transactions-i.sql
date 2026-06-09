/* Write your T-SQL query statement below */
with cte as (
    select *, format(trans_date,'yyyy-MM') as month from Transactions
)select t.month,t.country, count(*) as trans_count,sum(case when t.state = 'approved' then 1 else 0 end) as approved_count, sum(amount) as trans_total_amount, sum(case when t.state = 'approved' then t.amount else 0 end) as approved_total_amount from cte t group by t.month,t.country;