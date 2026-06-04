/* Write your T-SQL query statement below */
with cte as (
    select requester_id as t from RequestAccepted 
    union
    select accepter_id as t from RequestAccepted
),dte as (select cte.t as id,count(*) as num from cte inner join RequestAccepted as t1 on
cte.t = t1.requester_id or cte.t = t1.accepter_id group by cte.t )
select id,num from dte where num = (select max(num) from dte);