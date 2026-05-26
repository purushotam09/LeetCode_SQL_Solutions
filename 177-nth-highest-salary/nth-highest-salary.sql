CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    
        /* Write your T-SQL query statement below. */
        if @N <=0
        return null;

        RETURN (
         select distinct t1.salary from Employee t1 order by t1.salary desc offset (@N-1)  rows fetch next 1 rows only

    );
END
/* if we use return statement then not need to add that extra "select" to return null & 
remember offset can not be negative but can be zero and positive */
