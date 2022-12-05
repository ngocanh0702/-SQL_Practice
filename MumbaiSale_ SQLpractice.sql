
SELECT TOP 100 * FROM Sale_Project.dbo.customers$
SELECT TOP 100 * FROM Sale_Project.dbo.transactions$   
SELECT TOP 100 * FROM Sale_Project.dbo.date$
SELECT TOP 100 * FROM Sale_Project.dbo.products$
SELECT TOP 100 * FROM Sale_Project.dbo.markets$

-- Transactions for Mumbai market
SELECT markets_name
   , markets_code
FROM Sale_Project.dbo.markets$ 
WHERE markets_name LIKE 'Mumbai'   -- markets_code of Mumbai = Mark002


SELECT * FROM Sale_Project.dbo.transactions$ where market_code='Mark002'

-- Transactions in 2020 join by date table
SELECT 
    tst.*
	,dt.*
FROM Sale_Project.dbo.transactions$ as tst
INNER JOIN Sale_Project.dbo.date$ as dt
ON tst.order_date = dt.date 
WHERE dt.year =2020
-- Total revenue in 2020
SELECT SUM(tst.sales_amount) AS [Total revenue]
FROM Sale_Project.dbo.transactions$ as tst
INNER JOIN Sale_Project.dbo.date$ as dt
ON tst.order_date = dt.date 
WHERE dt.year =2020


-- Total revenue in year 2020, January Month
SELECT SUM(tst.sales_amount) AS [Total revenue]
FROM Sale_Project.dbo.transactions$ as tst
INNER JOIN Sale_Project.dbo.date$ as dt
ON tst.order_date = dt.date 
WHERE dt.year =2020
AND dt.month_name= 'January'


-- Total revenue in year 2020 in Mumbai
SELECT SUM(tst.sales_amount) AS [Total revenue]
FROM Sale_Project.dbo.transactions$ as tst
INNER JOIN Sale_Project.dbo.date$ as dt
ON tst.order_date = dt.date 
WHERE dt.year =2020
AND tst.market_code='Mark002'