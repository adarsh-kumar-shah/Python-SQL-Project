use ecommerce_db;

-- Basic Level Question

-- 1. List all unique cities where customers are located.
SELECT DISTINCT customer_city 
FROM customers 
ORDER BY customer_city ASC;

-- 2. How many orders were placed in 2017 vs 2018?
SELECT 
    YEAR(order_purchase_timestamp) AS order_year, 
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY YEAR(order_purchase_timestamp);

-- 3. Find the total payment value (revenue) for each product category.
SELECT 
    p.product_category_name, 
    SUM(pay.payment_value) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN payments pay ON oi.order_id = pay.order_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC;

-- 4. Calculate the percentage of orders that were paid in more than one installment.
SELECT 
    (COUNT(CASE WHEN payment_installments > 1 THEN 1 END) / COUNT(*)) * 100 AS percentage_multiple_installments
FROM payments;

-- 5. Count the number of customers from each state.
SELECT 
    customer_state, 
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;