#create database
create database retail_db;
use retail_db;
CREATE VIEW view_total_sales AS
SELECT 
    SUM(Cost) AS Total_Sales
FROM retail_dataset;
CREATE VIEW view_total_orders AS
SELECT 
    SUM(Quantity) AS Total_Quantity,
    COUNT(*) AS Total_Orders
FROM retail_dataset;
CREATE VIEW view_category_sales AS
SELECT 
    Category,
    SUM(Cost) AS Category_Sales
FROM retail_dataset
GROUP BY Category
ORDER BY Category DESC;
CREATE VIEW view_subcategory_sales AS
SELECT 
    `Sub-Category`,
    SUM(Cost) AS Sub_Category_Sales
FROM retail_dataset
GROUP BY `Sub-Category`
ORDER BY `Sub-Category` DESC;
SHOW COLUMNS FROM retail_dataset;
CREATE VIEW view_total_orderid AS
SELECT 
    COUNT(`ï»¿OrderID`) AS Total_Orders
FROM retail_dataset;
CREATE VIEW view_yearly_orders AS
SELECT 
    YEAR(
        COALESCE(
            STR_TO_DATE(OrderDate, '%Y-%m-%d'),
            STR_TO_DATE(OrderDate, '%d/%m/%Y'),
            STR_TO_DATE(OrderDate, '%m/%d/%Y'),
            STR_TO_DATE(OrderDate, '%d-%m-%Y')
        )
    ) AS Year,
    COUNT(*) AS Total_Orders
FROM retail_dataset
WHERE 
    COALESCE(
        STR_TO_DATE(OrderDate, '%Y-%m-%d'),
        STR_TO_DATE(OrderDate, '%d/%m/%Y'),
        STR_TO_DATE(OrderDate, '%m/%d/%Y'),
        STR_TO_DATE(OrderDate, '%d-%m-%Y')
    ) IS NOT NULL
GROUP BY Year
ORDER BY Year;

CREATE VIEW view_region_revenue AS
SELECT 
    Region,
    SUM(Revenue) AS Total_Revenue
FROM retail_dataset
GROUP BY Region
ORDER BY Region ASC;

CREATE VIEW view_top5_customers AS
SELECT 
    CustomerID,
    SUM(Revenue) AS Customer_Revenue
FROM retail_dataset
GROUP BY CustomerID
ORDER BY Customer_Revenue DESC
LIMIT 5;










