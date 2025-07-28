DROP TABLE IF EXISTS customer_shopping_data;
CREATE TABLE customer_shopping_data (
    invoice_no VARCHAR(20),
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    payment_method VARCHAR(20),
    invoice_date VARCHAR(20),
    shopping_mall VARCHAR(50)
);
SELECT COUNT(*) FROM customer_shopping_data;
SELECT 
    ROUND(AVG(order_total), 2) AS AOV
FROM (
    SELECT 
        invoice_no,
        SUM(price * quantity) AS order_total
    FROM 
        customer_shopping_data
    GROUP BY 
        invoice_no
) AS order_totals;


