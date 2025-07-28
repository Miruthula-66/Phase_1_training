SELECT 
    customer_id,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(price * quantity) AS total_spent
FROM 
    customer_shopping_data
GROUP BY 
    customer_id
ORDER BY 
    total_orders DESC
LIMIT 5;

SELECT 
    customer_id,
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(price * quantity) AS total_spent
FROM 
    customer_shopping_data
GROUP BY 
    customer_id
HAVING 
    COUNT(DISTINCT invoice_no) >= 1
ORDER BY 
    total_spent DESC
LIMIT 1;

