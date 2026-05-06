-- ================================================
-- PROJECT: Superstore Sales Analysis
-- Tool: SQLite / DB Browser
-- Author: Ashirwad Mohanty
-- ================================================

-- ------------------------------------------------ 
-- SECTION 1: BASIC EXPLORATION
-- ------------------------------------------------

-- 1. See all data
SELECT * FROM s1 LIMIT 10;

-- 2. Total sales
SELECT ROUND(SUM(Sales), 2) AS Total_Sales 
FROM s1;

-- 3. Count of unique customers
SELECT COUNT(DISTINCT "Customer ID") AS Total_Customers 
FROM s1;

-- 4. Overall business summary
SELECT 
  COUNT(DISTINCT "Order ID") AS Total_Orders,
  COUNT(DISTINCT "Customer ID") AS Total_Customers,
  ROUND(SUM(Sales), 2) AS Total_Revenue,
  ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM s1;

-- ------------------------------------------------
-- SECTION 2: SALES BY CATEGORY & PRODUCT
-- ------------------------------------------------

-- 5. Sales by Category
SELECT Category, ROUND(SUM(Sales), 2) AS Total_Sales
FROM s1
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 6. Sub-Category performance
SELECT "Sub-Category", ROUND(SUM(Sales), 2) AS Total_Sales
FROM s1
GROUP BY "Sub-Category"
ORDER BY Total_Sales DESC;

-- 7. Bottom 5 sub-categories by sales
SELECT "Sub-Category", ROUND(SUM(Sales), 2) AS Total_Sales
FROM s1
GROUP BY "Sub-Category"
ORDER BY Total_Sales ASC
LIMIT 5;

-- 8. Top 10 products by sales
SELECT "Product Name", ROUND(SUM(Sales), 2) AS Total_Sales
FROM s1
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- 9. Highest single sale ever
SELECT "Customer Name", "Product Name", Sales
FROM s1
ORDER BY Sales DESC
LIMIT 1;

-- ------------------------------------------------
-- SECTION 3: REGIONAL ANALYSIS
-- ------------------------------------------------

-- 10. Orders by Region
SELECT Region, COUNT("Order ID") AS Total_Orders
FROM s1
GROUP BY Region
ORDER BY Total_Orders DESC;

-- 11. Top 5 states by sales
SELECT State, ROUND(SUM(Sales), 2) AS Total_Sales
FROM s1
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 5;

-- 12. Top 5 cities by sales
SELECT City, ROUND(SUM(Sales), 2) AS Total_Sales
FROM s1
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

-- 13. Sales in West region only
SELECT "Product Name", ROUND(SUM(Sales), 2) AS Total_Sales
FROM s1
WHERE Region = 'West'
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- 14. Region contribution %
SELECT Region, 
  ROUND(SUM(Sales), 2) AS Region_Sales,
  ROUND(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM s1), 2) AS Pct_Contribution
FROM s1
GROUP BY Region
ORDER BY Region_Sales DESC;

-- ------------------------------------------------
-- SECTION 4: CUSTOMER & SEGMENT ANALYSIS
-- ------------------------------------------------

-- 15. Sales by Segment
SELECT Segment, ROUND(SUM(Sales), 2) AS Total_Sales
FROM s1
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 16. Average order value by Segment
SELECT Segment, ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM s1
GROUP BY Segment;

-- 17. Top 5 customers by total spend
SELECT "Customer Name", ROUND(SUM(Sales), 2) AS Total_Spent
FROM s1
GROUP BY "Customer Name"
ORDER BY Total_Spent DESC
LIMIT 5;

-- 18. Top customer per segment
SELECT Segment, "Customer Name", 
  ROUND(SUM(Sales), 2) AS Total_Spent
FROM s1
GROUP BY Segment, "Customer Name"
ORDER BY Segme
