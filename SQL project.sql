CREATE DATABASE ecommerce_project;

use ecommerce_project;

SELECT 'customers' as table_name, COUNT(*) as total_rows FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'items', COUNT(*) FROM items;

/*
ALTER TABLE orders MODIFY order_id VARCHAR(255);
ALTER TABLE items MODIFY order_id VARCHAR(255);

CREATE INDEX idx_orders_order_id ON orders(order_id);
CREATE INDEX idx_items_order_id ON items(order_id);
CREATE INDEX idx_orders_date ON orders(order_purchase_timestamp);
*/


-- Query 1: Monthly Revenue Trend

SELECT 
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month,
    ROUND(SUM(i.price), 2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN items i ON o.order_id = i.order_id
GROUP BY year, month
ORDER BY year, month;



-- Query 2 → Top 10 Products by Revenue


-- Kaun sa product sabse zyada bikaa
-- Kaun sa product sabse zyada revenue laya

-- item table see

SELECT 
    product_id,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(price), 2) AS total_revenue,
    ROUND(AVG(price), 2) AS avg_price
FROM items
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Key Insight 1: High price products (avg 1397rs) kam orders mein bhi zyada revenue dete hain
-- Key Insight 2: Cheap products (avg 71rs) zyada sell hota hai but kam revenue date hain 


-- Query 3 — Customer Order Count

-- Har customer ne kitne orders diye Kaun sabse zyada baar aaya 

-- Tables: orders + items JOIN

SELECT 
    o.customer_id,
    COUNT(DISTINCT o.order_id)   AS total_orders,
    ROUND(SUM(i.price), 2)       AS total_spent
FROM orders o
JOIN items i ON o.order_id = i.order_id
GROUP BY o.customer_id
ORDER BY total_orders DESC
LIMIT 10;


-- Key Insight: 90%+ customers ne sirf 1 order diya
-- Business Problem: Customer retention bahut low hai
-- Recommendation: Loyalty program banana chahiye Repeat customers ko discount dena chahiye



-- Query 4 — Average Delivery Days by State

-- Har state mein delivery kitne din mein hoti hai
-- Kaun sa state fastest delivery pata hai
-- Kaun sa state slowest hai

-- Tables: orders + customers JOIN
-- Insight: Delivery problem identify karna by region

SELECT 
    c.customer_state,
    ROUND(AVG(o.delivery_days), 1) AS avg_delivery_days,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.delivery_days IS NOT NULL
  AND o.delivery_days > 0
GROUP BY c.customer_state
ORDER BY avg_delivery_days ASC;

/*

1. SP (Sao Paulo) fastest + sabse zyada orders
   → Warehouse SP mein hi hoga
   → Nearby states fast delivery paate hain

2. RR, AP, AM slowest
   → Door hain warehouse se
   → Remote areas = slow delivery

3. SP ke 40,484 orders vs RR ke 41 orders
   → Business mostly SP concentrated hai

*/

-- Fastest: SP = 8.3 days (40K+ orders)
-- Slowest: RR = 29 days (41 orders)
-- Insight: Warehouse SP mein hai isliye SP fastest
-- Recommendation: Remote states ke liye local warehouse banana chahiye


-- Query 5 — Cancelled Orders Analysis

/*

Kitne orders cancel hue
Kaun se state mein sabse zyada cancellation hai
Cancel orders ka revenue loss kitna tha
Cancellation pattern dhundhna

*/

-- Tables: orders + items + customers
-- Insight: Kaun sa state mein loss zyada hai

SELECT 
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS cancelled_orders,
    ROUND(SUM(i.price), 2) AS revenue_lost
FROM orders o
JOIN items i ON o.order_id = i.order_id
JOIN customers c ON o.customer_id =c.customer_id
WHERE o.order_status = 'canceled'
GROUP BY c.customer_state
ORDER BY cancelled_orders DESC;


/*

1. SP mein sabse zyada cancellation
   → SP mein orders bhi sabse zyada hain
   → Cancellation rate normal ho sakti hai

2. GO state interesting hai
   → Sirf 9 cancellations
   → But 6,721 revenue lost
   → Matlab mehnge products cancel hue

3. Total revenue lost = ~1 Lakh+
   → Significant business loss

*/

-- SP: 247 cancellations → 37K revenue lost
-- GO: Sirf 9 cancel but 6.7K lost → expensive items
-- Total Loss: ~1 Lakh revenue

ALTER TABLE items MODIFY product_id TEXT;


