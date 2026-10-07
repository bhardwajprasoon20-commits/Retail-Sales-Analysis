-- ============================================
-- RETAIL SALES ANALYSIS
-- Author: Prasoon Bhardwaj
-- Database: MySQL
-- ============================================


-- ============================================
-- 1. OVERALL SALES PERFORMANCE
-- ============================================

SELECT
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    SUM(Total_Sales) AS Total_Sales,
    ROUND(SUM(Total_Sales) / COUNT(*), 2) AS Average_Order_Value
FROM sales;


-- ============================================
-- 2. SALES BY CATEGORY
-- ============================================

SELECT
    Category,
    SUM(Total_Sales) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;


-- ============================================
-- 3. SALES BY REGION
-- ============================================

SELECT
    Region,
    SUM(Total_Sales) AS Total_Sales
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;


-- ============================================
-- 4. MONTHLY SALES TREND
-- ============================================

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Total_Sales) AS Total_Sales
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month;


-- ============================================
-- 5. TOP 5 PRODUCTS
-- ============================================

SELECT
    Product,
    SUM(Total_Sales) AS Total_Sales
FROM sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 5;


-- ============================================
-- 6. PAYMENT MODE ANALYSIS
-- ============================================

SELECT
    Payment_Mode,
    COUNT(*) AS Total_Orders,
    SUM(Total_Sales) AS Total_Sales
FROM sales
GROUP BY Payment_Mode
ORDER BY Total_Sales DESC;


-- ============================================
-- 7. AVERAGE ORDER VALUE BY REGION
-- ============================================

SELECT
    Region,
    COUNT(*) AS Total_Orders,
    SUM(Total_Sales) AS Total_Sales,
    ROUND(SUM(Total_Sales) / COUNT(*), 2) AS Average_Order_Value
FROM sales
GROUP BY Region
ORDER BY Average_Order_Value DESC;


-- ============================================
-- 8. TOP 5 CUSTOMERS
-- ============================================

SELECT
    Customer,
    COUNT(*) AS Total_Orders,
    SUM(Total_Sales) AS Total_Sales
FROM sales
GROUP BY Customer
ORDER BY Total_Sales DESC
LIMIT 5;