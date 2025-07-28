SELECT *
FROM (
    SELECT 
        customer_id,
        ROUND(SUM(quantity * price), 2) AS total_spend,
        RANK() OVER (ORDER BY SUM(quantity * price) DESC) AS spend_rank
    FROM 
        customer_shopping_data_small
    GROUP BY 
        customer_id
) AS ranked_customers
WHERE spend_rank <= 5;
