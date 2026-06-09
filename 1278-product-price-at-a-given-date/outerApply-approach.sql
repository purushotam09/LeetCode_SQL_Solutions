SELECT 
    p.product_id,
    ISNULL(x.new_price, 10) AS price
FROM
(
    SELECT DISTINCT product_id
    FROM Products
) p
OUTER APPLY
(
    SELECT TOP 1 new_price
    FROM Products p2
    WHERE p2.product_id = p.product_id
      AND p2.change_date <= '2019-08-16'
    ORDER BY p2.change_date DESC
) x;
