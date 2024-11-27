--Adidas Sales Data Exploration

-- Create time Intelligence table I.E Date table
CREATE TABLE dbo.DateTable (
    DateKey INT PRIMARY KEY,       -- Format: YYYYMMDD
    Invoicedate DATE NOT NULL,
    Day INT,
    Month INT,
    Year INT,
    Quarter INT,
    MonthName NVARCHAR(10),         -- e.g., "January"
);

--Populate the dimension date table
DECLARE @CurrentDate DATE = '2020-01-01';  -- Used the Start date
DECLARE @EndDate DATE = '2021-12-31';     -- Set the end date

WHILE @CurrentDate <= @EndDate
BEGIN
INSERT INTO DateTable(
        DateKey,
        Invoicedate,
        Day,
        Month,
        Year,
        Quarter,
        MonthName
)
        VALUES (
        CONVERT(INT, FORMAT(@CurrentDate, 'yyyyMMdd')),         -- DateKey as YYYYMMDD
        @CurrentDate,                                           -- Invoicedate
        DAY(@CurrentDate),                                      -- Day
        MONTH(@CurrentDate),                                    -- Month
        YEAR(@CurrentDate),                                     -- Year
        DATEPART(QUARTER, @CurrentDate),                        -- Quarter
        DATENAME(MONTH, @CurrentDate)                           -- MonthName
    );

    -- Increment the @CurrentDate by 1 day
    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END

--Analyzing total sales of each product to identify the best-selling items 
SELECT 
   Product,
   SUM([Units Sold]) AS TotalQuantitySold,
   SUM([Total Sales]) AS TotalSalesAmount
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    Product
ORDER BY 
     TotalSalesAmount DESC;

--Analyzing total sales and unit sold by region
SELECT 
   Region,
   SUM([Units Sold]) AS TotalUnitSold,
   SUM([Total Sales]) AS TotalSalesAmount
FROM 
    ['Data_Sales _Adidas] s
JOIN Location l ON s.[Location Key] = l.LocationKey
GROUP BY 
    Region
ORDER BY 
     TotalSalesAmount DESC;

--Determining Profitability Margin across region
SELECT 
   Region,
	AVG([Operating Margin]) AS ProfitMargin
FROM 
    ['Data_Sales _Adidas] f
JOIN Location l ON f.[Location Key] = l.LocationKey
GROUP BY 
    Region
ORDER BY 
     ProfitMargin DESC;

--Identify which products are the most profitable and which ones have the highest margins.
SELECT 
    Product,
    SUM([Operating Profit]) AS Total_Operating_Profit,
    ROUND(AVG([Operating Margin]),2) AS Average_Operating_Margin
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    Product
ORDER BY 
    Total_Operating_Profit DESC;

-- Analyzing top-10 performing geographic areas for the business.
SELECT TOP 10
    L.City,
    L.State,
    SUM(S.[Total Sales]) AS Total_Sales
FROM 
    ['Data_Sales _Adidas] S
JOIN 
    Location L ON S.[Location Key] = L.LocationKey
GROUP BY 
    L.City, 
	L.State
ORDER BY 
    Total_Sales DESC;

--Analyzing whether higher-priced products contribute more to revenue or if lower-priced items sell in higher volume.
SELECT 
    Product,
    ROUND(AVG([Price per Unit]),2) AS Average_Price,
    SUM([Total Sales]) AS Total_Sales
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    Product
ORDER BY 
    Average_Price DESC;

--Evaluating which sales method (channel) is more profitable and generates more revenue.
SELECT 
    [Sales Method],
    SUM([Total Sales]) AS Total_Sales,
    ROUND(SUM([Operating Profit]),2) AS Total_Operating_Profit
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    [Sales Method]
ORDER BY Total_Operating_Profit DESC;

--Analyzing Top Products by Units Sold i.e most popular products by sales volume.
SELECT
    Product,
    SUM([Units Sold]) AS Total_Units_Sold
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    Product
ORDER BY 
    Total_Units_Sold DESC;

--Analyzing which retailers contribute the most to overall sale.
SELECT 
    Retailer,
    SUM([Total Sales]) AS Total_Sales
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    Retailer
ORDER BY 
    Total_Sales DESC;

--Analyzing the frequency with which retailers make purchases.
SELECT distinct
    [Retailer ID],
    COUNT([Invoice Date]) AS Purchase_Frequency
FROM 
   ['Data_Sales _Adidas]
GROUP BY 
    [Retailer ID]
ORDER BY 
    Purchase_Frequency DESC;

--Analyzing the most profitable product by sales channel.
SELECT TOP 5
    [Sales Method],
    Product,
    ROUND(AVG([Operating Margin]),3) AS Average_Operating_Margin
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    [Sales Method],
	Product
ORDER BY 
    Average_Operating_Margin DESC;

--determining regional and channel-specific average order values.
SELECT TOP 5
    L.Region,
    S.[Sales Method],
    AVG(S.[Total Sales]) AS Average_Order_Value
FROM 
    ['Data_Sales _Adidas] S
JOIN 
    [Location] L ON S.[Location Key] = L.LocationKey
GROUP BY 
    L.Region, 
	S.[Sales Method]
ORDER BY 
     Average_Order_Value DESC;


--Monthly Sales Trend Analysis (This query aggregates sales by month and year to show monthly trends over time.)
SELECT d.MonthName, 
       d.Year, 
       SUM(s.[Total Sales]) AS MonthlySales
FROM ['Data_Sales _Adidas] s
JOIN DateTable d ON s.[Invoice Date] = d.Invoicedate
GROUP BY d.MonthName, 
         d.Year
ORDER BY MonthlySales DESC;

--Year-over-Year Growth Analysis
--This query calculates the yearly growth in sales by comparing each year to the previous one.
SELECT d.Year, 
       SUM(s.[Total Sales]) AS YearlySales,
       LAG(SUM(s.[Total Sales])) OVER (ORDER BY d.Year) AS PreviousYearSales,
       (SUM(s.[Total Sales]) - LAG(SUM(s.[Total Sales])) OVER (ORDER BY d.Year)) / NULLIF(LAG(SUM(s.[Total Sales])) OVER (ORDER BY d.Year), 0) * 100 AS YoYGrowthPercentage
FROM ['Data_Sales _Adidas] s
JOIN DateTable d ON s.[Invoice Date] = d.Invoicedate
GROUP BY d.Year
ORDER BY YearlySales DESC;

-- Quarterly Sales Analysis
--This query aggregates total sales by quarter and year, which can help reveal seasonal trends.
SELECT d.Year, 
       d.Quarter, 
       SUM(s.[Total Sales]) AS QuarterlySales
FROM ['Data_Sales _Adidas] s
JOIN DateTable d ON s.[Invoice Date] = d.Invoicedate
GROUP BY d.Year, 
         d.Quarter
ORDER BY QuarterlySales DESC;

--Average sales for each month across all year
SELECT d.Year,
       d.MonthName,
       ROUND(AVG(s.[Total Sales]),2) AS AVGMonthlySales
FROM ['Data_Sales _Adidas] s
JOIN DateTable d ON s.[Invoice Date] = d.Invoicedate
GROUP BY d.Year, 
         d.MonthName
ORDER BY AVGMonthlySales DESC;

--Sales Seasonality by Month
SELECT d.MonthName,
       AVG(s.[Total Sales]) AS AvgMonthlySales
FROM ['Data_Sales _Adidas] s
JOIN DateTable d ON s.[Invoice Date] = d.Invoicedate
GROUP BY d.MonthName
ORDER BY AvgMonthlySales DESC; 

--Year-to-Date (YTD) Sales
--This query calculates cumulative sales from the beginning of each year up to the current date.
SELECT d.Year, 
       d.MonthName, 
       SUM(s.[Total Sales]) AS MonthlySales,
       SUM(SUM(s.[Total Sales])) OVER (PARTITION BY d.Year ORDER BY MONTH(d.Invoicedate)) AS YTDSales
FROM ['Data_Sales _Adidas] s
JOIN DateTable d ON s.[Invoice Date] = d.Invoicedate
GROUP BY d.Year, 
         d.MonthName, 
		 MONTH(d.Invoicedate)
ORDER BY YTDSales DESC;


--Analyze the year-over-year growth in sales for each product to determine growth trends.
WITH YearlySales AS (
    SELECT 
        Product,
        YEAR([Invoice Date]) AS Sales_Year,
        SUM([Total Sales]) AS Total_Sales
    FROM 
        ['Data_Sales _Adidas]
    GROUP BY 
        Product, 
		YEAR([Invoice Date])
)
SELECT 
    Y1.Product,
    Y1.Sales_Year AS Current_Year,
    Y1.Total_Sales AS Sales_Current_Year,
    Y2.Total_Sales AS Sales_Previous_Year,
    ((Y1.Total_Sales - Y2.Total_Sales) / Y2.Total_Sales) * 100 AS Sales_Growth_Percentage
FROM 
    YearlySales Y1
LEFT JOIN 
    YearlySales Y2 ON Y1.Product = Y2.Product AND Y1.Sales_Year = Y2.Sales_Year + 1
ORDER BY 
    Sales_Growth_Percentage DESC;

--Sales Distribution by Sales Method (Online vs. In-Store)
SELECT 
    [Sales Method],
    ROUND(SUM([Total Sales]),2) AS Total_Sales,
    ROUND(SUM([Operating Profit]),2) AS Total_Operating_Profit
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    [Sales Method]
ORDER BY 
    Total_Sales DESC;

--Analyzed Average Units Sold by Sales Channel
SELECT 
    [Sales Method],
    ROUND(AVG([Units Sold]),2) AS Average_Units_Sold
FROM 
    ['Data_Sales _Adidas]
GROUP BY 
    [Sales Method]
ORDER BY 
    Average_Units_Sold DESC;
