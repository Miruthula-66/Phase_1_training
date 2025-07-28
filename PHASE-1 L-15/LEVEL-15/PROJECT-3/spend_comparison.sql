SELECT 
    gender,
    SUM(quantity * price) AS Total_Spend,
    AVG(quantity * price) AS Average_Spend,
    MAX(quantity * price) AS Max_Spend,
    MIN(quantity * price) AS Min_Spend
FROM 
    customer_shopping_data_small
GROUP BY 
    gender;
