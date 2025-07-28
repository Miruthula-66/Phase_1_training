SELECT customer_id
FROM customer_shopping_data_small
WHERE YEAR(STR_TO_DATE(invoice_date, '%d/%m/%Y')) = 2022
  AND QUARTER(STR_TO_DATE(invoice_date, '%d/%m/%Y')) = 4
GROUP BY customer_id;

SELECT customer_id
FROM customer_shopping_data_small
WHERE YEAR(STR_TO_DATE(invoice_date, '%d/%m/%Y')) = 2023
  AND QUARTER(STR_TO_DATE(invoice_date, '%d/%m/%Y')) = 1
GROUP BY customer_id;

SELECT customer_id
FROM customer_shopping_data_small
WHERE (YEAR(STR_TO_DATE(invoice_date, '%d/%m/%Y')) = 2022 AND QUARTER(STR_TO_DATE(invoice_date, '%d/%m/%Y')) = 4)
   OR (YEAR(STR_TO_DATE(invoice_date, '%d/%m/%Y')) = 2023 AND QUARTER(STR_TO_DATE(invoice_date, '%d/%m/%Y')) = 1)
GROUP BY customer_id
HAVING COUNT(DISTINCT QUARTER(STR_TO_DATE(invoice_date, '%d/%m/%Y'))) = 2;

