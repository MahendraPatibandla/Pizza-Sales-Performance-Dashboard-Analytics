
SELECT * FROM pizza_sales

--1) KPI's
SELECT SUM(total_price) as Total_Revenue FROM pizza_sales

SELECT SUM(total_price)/Count(DISTINCT order_id) as Average_Order_Value
FROM pizza_sales

SELECT SUM(quantity) as Total_Pizzas_Sold FROM pizza_sales

SELECT COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales

SELECT CAST(Cast(Sum(quantity) AS DECIMAL(10,2)) / 
CAST(Count(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2))
AS Average_Pizzas_Per_Order FROM pizza_sales


--2) Charts:
Select * FROM pizza_sales

SELECT DATENAME(DW, order_date) as order_day,
COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
order by order_day

SELECT DATEPART(HOUR, order_time) as order_hour,
COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY order_hour

SELECT pizza_category, CAST(sum(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percentage_Of_Sales
from pizza_sales
GROUP BY pizza_category

SELECT pizza_size, CAST(sum(total_price) * 100 / 
(SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Percentage_Of_Sales
from pizza_sales
GROUP BY pizza_size

SELECT pizza_category, SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category

SELECT TOP 5 pizza_name, SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
order by Total_Pizzas_Sold desc

SELECT TOP 5 pizza_name, SUM(quantity) as Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
order by Total_Pizzas_Sold asc