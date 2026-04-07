-- Write your query below
WITH cte as (
    SELECT 
        c.customer_id,
        c.customer_name,
        MAX(CASE WHEN o.product_name='A' THEN 1 ELSE 0 END) has_a,
        MAX(CASE WHEN o.product_name='B' THEN 1 ELSE 0 END) has_b,
        MAX(CASE WHEN o.product_name='C' THEN 1 ELSE 0 END) has_c
    FROM customers c
    INNER JOIN orders o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id, customer_name
FROM CTE
where has_a > 0 AND has_b > 0 and has_c = 0
order by customer_name 
