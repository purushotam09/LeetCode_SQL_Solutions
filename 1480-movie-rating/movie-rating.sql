/* Write your T-SQL query statement below */
select t1.results as results from (select top 1 u.name as results from MovieRating mr inner join Users u on mr.user_id = u.user_id group by mr.user_id,u.name order by count(*) desc,u.name asc) as t1
union all
select t2.results as results from (select top 1 m.title as results from MovieRating mr inner join Movies m on mr.movie_id = m.movie_id and mr.created_at >= '2020-02-01' and mr.created_at < '2020-03-01' group by mr.movie_id,m.title order by avg(mr.rating*1.0) desc,m.title asc) as t2;