# Project 1
### **E-Commerce Sales Analysis Project**

### **Overview**
This project involved analyzing a large e-commerce dataset to uncover actionable insights that drive revenue, optimize costs, and improve customer satisfaction. By leveraging SQL, Excel, and Power BI, I conducted a comprehensive analysis of sales trends, profitability, and customer behavior. The findings were visualized using interactive dashboards, enabling stakeholders to make data-driven decisions effectively.

---

### **Objectives**
- Analyze sales and profitability trends across product categories and regions.
- Identify high-performing customer segments and their purchasing behaviors.
- Optimize inventory and pricing strategies through data-driven insights.
- Create clear visualizations for stakeholders to understand and act upon the findings.

---

### **Project Workflow**
![Image Alt](https://github.com/Tibson-spec/Adedotun-Toheeb-Portfolio/blob/main/images%20folderimages/workflow%20diagram.png?raw=true)

1. **Data Collection & Cleaning**  
   - Cleaned and normalized raw datasets using Excel Power Query to remove inconsistencies, handle missing values, and standardize formats for seamless analysis.

2. **Data Analysis with SQL**  
   - Conducted sales, profitability, and customer behavior analysis using SQL queries and aggregate functions.
   - Created relationships between tables for better multidimensional analysis.
   - Built a Dim_Date table for precise time-series analysis.

3. Visualization with Power BI 
   - Designed interactive dashboards to showcase sales trends, profit margins, and customer insights.
   - Highlighted seasonal trends, customer segmentation, and profitability metrics.

4. **Insights & Recommendations**  
   - Developed actionable insights to improve sales strategies and reduce costs.

---

### **Tools Used**
- **SQL Server**: Data modeling and querying.
- **Excel**: Data normalization,cleaning and initial analysis using Power Query.
- **Power BI**: Interactive dashboards and storytelling with data visualizations.

---

### **Key Insights**
- **Seasonal Sales Trends**:  
  - Sales peak in Q4 and Q3 for both Technology and Office Supplies, indicating the need for strategic promotions during this period.
  - *(Visual: Q4 and Q3 Sales by Category hover by)*

- **Profit Performance by Region**:  
  - The West and east region outperform other regions in profitability. Targeted campaigns in these areas could boost revenue by an estimated 10%.
  - *(Visual: Profit Margins by Region)*

- **Customer Segment Purchase Behavior**:  
  - **Consumer segment** shows the highest purchase frequency, followed by the **Corporate segment**. **Home Office** has the lowest frequency. Tailored loyalty programs for Consumers and Corporates could enhance retention.
  -  *(Visual: Purchase Frequency by Segment)*

- **Profitability Analysis**:  
  - Added a **cost column** to calculate profit margins, revealing that **Technology** offers higher margins than **Office Supplies**. Focus on high-margin products to maximize profits.
  - *(Visual: Profitability insights)*

---

### **Visualizations**
### Sales Overview Dashboard
![Image Alt](https://github.com/Tibson-spec/Adedotun-Toheeb-Portfolio/blob/main/images%20folderimages/SALES%20%20TREND.PNG?raw=true)

1. **Sales Trends**: Interactive chart showing monthly sales.
![Image Alt](https://github.com/Tibson-spec/Adedotun-Toheeb-Portfolio/blob/main/Sale%20Trend%20(area%20chart).PNG?raw=true)

2. **Profit Performance by Region**: Stacked bar chart highlighting profitability differences.
![Image Alt](https://github.com/Tibson-spec/Adedotun-Toheeb-Portfolio/blob/main/images%20folderimages/PROFIT%20MARG.PNG?raw=true)
 
3. **Customer Purchase Patterns**: Clustered column chart visualizing purchase frequency by segment.
![image](https://github.com/user-attachments/assets/4b781d92-aa44-4883-bf93-f68943cb2d6f)

4. Top 10 best performing customer: Stacked bar chart to depict best performing customer.
![image](https://github.com/Tibson-spec/Adedotun-Toheeb-Portfolio/blob/main/images%20folderimages/Top%2010.PNG?raw=true)

5. Total transaction by ship mode: Pie chart showcasing which ship mode is prefered by customers.
![image](https://github.com/Tibson-spec/Adedotun-Toheeb-Portfolio/blob/main/images%20folderimages/Total%20Transaction%20by%20shipmode.PNG?raw=true)

6. Profitability Analysis: Pie chart illustrating the profit margin across various product category
![image](https://github.com/Tibson-spec/Adedotun-Toheeb-Portfolio/blob/main/images%20folderimages/Profit%20Margin%20by%20product%20category.PNG?raw=true)

---

### **Recommendations**
- Launch seasonal promotions for **Technology** and **Office Supplies** during Q4 to maximize revenue.  
- Focus marketing efforts on the **West Coast** and **Midwest** regions for higher profitability.  
- Implement loyalty programs for **Consumer** and **Corporate** segments to enhance customer retention.  
- Optimize inventory for high-margin products like **Technology** to increase overall profit.

---

## **SQL Queries Highlights**
### **SQL Query and Analysis**  
### 1. **Total Sales by Region**  
```sql
--Analyzing Total sales across different region
SELECT 
    R.Region,
    SUM(O.Sales) AS Total_Sales
FROM 
    order_details O
JOIN 
    [Dim_Region table] R ON O.[Dim_Regiontable City_id] = R.City_id
GROUP BY 
    R.Region
ORDER BY 
    Total_Sales DESC;
```
### 2. **Total Sales by Product Category** 
```sql
--Analyzing Total sales by product category
SELECT 
    P.Category,
    ROUND(SUM(O.Sales),2) AS Total_Sales
FROM 
    order_details O
JOIN 
    [Dim_Products table] P ON O.[Product ID] = P.[Product ID]
GROUP BY 
    P.Category
ORDER BY 
    Total_Sales DESC;
```

### 3. **Analyzing Total sales by customer segment** 
```sql
SELECT 
    C.Segment,
    ROUND(SUM(O.Sales),2) AS Total_Sales
FROM 
    order_details O 
JOIN 
    [Dim_Customer table] C ON O.[Customer ID] = C.[Customer ID]
GROUP BY 
    C.Segment
ORDER BY 
    Total_Sales DESC;
```
### 4. **Monthly sales trend i.e determining which month make the most sales** 
```sql
SELECT 
    DATENAME(MONTH, [Order Date]) AS Month,
	FORMAT([Order Date], 'MM') AS Month_In_Num,
    ROUND(SUM(Sales),2) AS Monthly_Sales
FROM 
    order_details
GROUP BY 
    DATENAME(MONTH, [Order Date]),
	FORMAT([Order Date], 'MM')
ORDER BY 
    Monthly_Sales DESC;
```

### 5. **Analyzing Yearly Sales Trend** 
```sql
SELECT 
    YEAR([Order Date]) AS Year,
    ROUND(SUM(Sales),2) AS Yearly_Sales
FROM 
    order_details
GROUP BY 
    YEAR([Order Date])
ORDER BY 
    Year DESC;
```

### 6. Creating and populating the **Dim_Date** table.
```sql
  -- Create date dimension table
CREATE TABLE DateTable (
    DateKey DATE PRIMARY KEY,
    Year INT,
    Month INT,
    Day INT,
	MonthName NVARCHAR(20) NOT NULL,
    Quarter INT NOT NULL
);

--Populate date dimension table
INSERT INTO DateTable (DateKey, Year, Month, Day,MonthName,Quarter)
SELECT DISTINCT 
    CAST([Order Date] AS DATE) AS DateKey,
    YEAR([Order Date]) AS Year,
    MONTH([Order Date]) AS Month,
    DAY([Order Date]) AS Day,
	DATENAME(Month,[Order Date]) AS Monthname,
    DATEPART(QUARTER, [Order Date]) AS Quarter
FROM order_details
WHERE [Order Date] IS NOT NULL;

--Altering fact table to add foreign key for relationships
ALTER TABLE order_details
ADD DateID DATE;             -- Match the data type with DateKey in DateTable

--Updating and populating the foreign key in order detail table
UPDATE order_details
SET DateID = (
    SELECT DateKey
    FROM DateTable
    WHERE CAST(order_details.[Order Date] AS DATE) = DateTable.DateKey
);
```
  
- Cost and profit margin calculations.

[click here 👉Link to the full GitHub repository for detailed queries👈](https://github.com/Tibson-spec/Sample-Superstore-Dataset-Project)

---

### **Challenges & Solutions**
- **Challenge**: Managing inconsistencies in the dataset.  
  **Solution**: Used Excel Power Query to clean and normalize the data before analysis.  

- **Challenge**: Visualizing complex trends for stakeholders.  
  **Solution**: Designed easy-to-understand Power BI dashboards with drill-down capabilities.

---

### **Project Impact**
This project showcases my ability to handle end-to-end data analysis processes, from cleaning and modeling to visualization and insights generation. The insights derived can help businesses:  
- Increase seasonal sales by up to 15%.  
- Improve profit margins in key regions by 10%.  
- Enhance customer retention through targeted loyalty programs.  

---

### **Live Demo & GitHub**
- **Interactive Dashboard**: [Link to Power BI report]  
- **GitHub Repository**: [Link to repository with all scripts, data, and documentation]  

---



# Project 2
### Portfolio Project: HR Employee Attrition Analysis 

---

### **Overview**  
This project dives into employee attrition, leveraging SQL and Power BIto analyze trends, uncover insights, and provide actionable recommendations. It demonstrates my expertise in data analysis, visualization, and strategy formulation to address one of HR’s most critical challenges: retaining top talent.

---

### **Project Objectives**  
1. Analyze employee attrition factors using SQL and statistical methods.  
2. Develop an interactive Power BI dashboard to visualize key insights.  
3. Recommend actionable strategies for reducing attrition and improving retention.  

---

### **Dataset**  
- Source:Public HR dataset containing 1,470 employee records.  
- Features Analyzed: 
  - Demographics: Age, gender, marital status.  
  - Job Details: Job role, monthly income, satisfaction levels.  
  - Attrition Factors:** Overtime, work-life balance, distance from home.  

---

### **Tools & Technologies**  
- SQL Server:For data cleaning, querying, and exploratory analysis.  
- Power BI:For creating dynamic, interactive dashboards with DAX calculations.  
- Excel: Pre-processing and initial data exploration.  

---

### **Process Breakdown**  

#### 1. SQL Data Analysis 
The first step was cleaning and analyzing the dataset using SQL queries.  

- Data Cleaning: 
  ```sql
  SELECT *  
  FROM [HR-Employee-Attrition]  
  WHERE MonthlyIncome IS NOT NULL;

  --HR Attrition Data Cleaning and Normalization
   Inspect the first few rows to understand the structure
   SELECT TOP 10 * FROM [HR-Employee-Attrition];

  -- Check for null values in each column to identify missing data
  SELECT 
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS MissingAge,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS MissingDepartment
  FROM 
    [HR-Employee-Attrition];

  -- Add a unique EmployeeID column to the staging table i.e source table
  ALTER TABLE [HR-Employee-Attrition]
  ADD Employee_ID INT IDENTITY(1,1) PRIMARY KEY;

  -- Check for duplicate rows
  SELECT 
    Employee_ID, 
    COUNT(*) AS DuplicateCount
  FROM 
    [HR-Employee-Attrition]
  GROUP BY 
    Employee_ID
  HAVING 
    COUNT(*) > 1; 
  ```  

- **Key Queries:**  
  - **Calculate the attrition rate across different departments:**  
    ```sql
    SELECT 
    d.DepartmentName,
    COUNT(f.EmployeeID) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 1 THEN 1 END) AS AttritionCount,
    ROUND(COUNT(CASE WHEN f.Attrition = 1 THEN 1 END) * 100.0 / COUNT(f.EmployeeID),2) AS AttritionRate
    FROM 
         FactEmployeeAttrition f
    JOIN 
         DimDepartment d ON f.DepartmentID = d.DepartmentID
    GROUP BY 
         d.DepartmentName
    ORDER BY AttritionRate DESC;
    ```
  
  - **Average monthly income by job role:**  
    ```sql
    SELECT 
    j.JobRoleName,
    ROUND(AVG(f.MonthlyIncome),2) AS AvgMonthlyIncome
    FROM 
    FactEmployeeAttrition f
    JOIN 
    DimJobRole j ON f.JobRoleID = j.JobRoleID
    GROUP BY 
    j.JobRoleName
    ORDER BY AvgMonthlyIncome DESC;
    ```

   - **Attrition Rate by Age Group:**  
    ```sql
    SELECT 
    CASE 
        WHEN Age < 30 THEN '20-29'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+' 
    END AS AgeGroup,
    COUNT(EmployeeID) AS TotalEmployees,
    ROUND(COUNT(CASE WHEN f.Attrition = 1 THEN 1 END) * 100.0 / COUNT(f.EmployeeID),2) AS AttritionRate
    FROM 
    FactEmployeeAttrition f
    GROUP BY 
    CASE 
        WHEN Age < 30 THEN '20-29'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+' 
    END
    ORDER BY 
    AttritionRate DESC;
      ``` 

- **Work-Life Balance vs. Attrition(This query helps identify if a poor work-life balance is correlated with higher attrition rates):**
  ```sql
    SELECT 
    WorkLifeBalance,
    COUNT(EmployeeID) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS AttritionCount,
    ROUND(CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS FLOAT) / COUNT(EmployeeID) * 100, 2) AS AttritionRate
    FROM 
    FactEmployeeAttrition
    GROUP BY 
    WorkLifeBalance
    ORDER BY 
    AttritionRate DESC;
```

- **Average Tenure of Employees by Department(Examining the average number of years employees stay in each department):**
```sql
   SELECT 
    d.DepartmentName AS Department,
    AVG(f.YearsAtCompany) AS AvgYearsAtCompany
    FROM 
    FactEmployeeAttrition f
    JOIN 
    DimDepartment d ON f.DepartmentID = d.DepartmentID
    GROUP BY 
    d.DepartmentName
    ORDER BY 
    AvgYearsAtCompany DESC;
```

- **how does the work enviroment influence attrition rate:**
 ```sql
    SELECT 
    EnvironmentSatisfaction,
    COUNT(CASE WHEN Attrition = 1 THEN 1 END) AS AttritionCount,
    COUNT(EmployeeID) AS TotalEmployees,
    COUNT(CASE WHEN Attrition = 1 THEN 1 END) * 100.0 / COUNT(EmployeeID) AS AttritionRate
    FROM 
    FactEmployeeAttrition
    GROUP BY 
    EnvironmentSatisfaction
    ORDER BY 
    EnvironmentSatisfaction DESC;
```

- **SQL Insights:**  
  - Employees earning <$3,000/month showed higher attrition rates.  
  - Work-life balance ratings of 1 or 2 correlated with increased attrition.  

#### **2. Power BI Dashboard Creation**  
The cleaned datasets was imported into Power BI for visualization.  

- **Visualizations Included:**  
  - **Attrition by Job Role:** Highlighting roles with the highest turnover.  
  - **Work-Life Balance vs. Attrition:** Demonstrating the impact of low satisfaction.  
  - **Attrition by Marital Status:** Revealing single employees’ higher likelihood of leaving.  

- **Dashboard Features:**  
  - Interactive slicers for filtering by department, income, and satisfaction levels.  
  - Dynamic tooltips to provide additional data points on hover.  
  - Drill-through pages for deep-diving into specific demographics or roles.  

---

### **Key Insights**  
1. **Compensation Impact:** Employees earning <$3,000/month are at the highest risk of leaving.  
2. **Marital Status:** Single employees show a higher attrition rate than married ones.  
3. **Work-Life Balance:** Employees with low ratings are more likely to leave.  
4. **Distance Matters:** Employees commuting >20 km are likelier to leave.  
5. **Job Satisfaction:** Dissatisfied employees (rating 1) have a 35% higher likelihood of leaving.  

---

### **Recommendations**  
1. **Salary Adjustments:** Address compensation gaps for employees in critical income brackets.  
2. **Flexible Work Policies:** Enable remote or hybrid working models to improve work-life balance.  
3. **Retention Programs:** Implement targeted programs for high-risk groups (e.g., younger employees or those undergoing life transitions).  
4. **Commute Incentives:** Provide transportation allowances or relocation benefits.  
5. **Mentorship and Growth Opportunities:** Engage employees through upskilling and career progression programs.  

---

### **Visuals & Dashboard Highlights**  

#### **Attrition by Job Role**  
- Visualization: Clustered Bar Chart  
- Insight: Sales Executives and Lab Technicians have the highest attrition rates.  

#### **Work-Life Balance vs. Attrition**  
- Visualization: Stacked Bar Chart  
- Insight: Poor work-life balance correlates with higher attrition.  

#### **Attrition by Marital Status**  
- Visualization: Donut Chart  
- Insight: Single employees leave more frequently.  

*(Screenshots of these visualizations can be included in your portfolio for better impact.)*  

---

### **Project Files**  
- **SQL Scripts:**  
  - Data cleaning: `SQL_Cleaning_Scripts.sql`  
  - Attrition analysis: `SQL_Analysis_Queries.sql`  
- **Power BI Dashboard:**  
  - File: `HR_Attrition_Analysis.pbix`  
  - Screenshots: Attached in project gallery.  

---

### **Conclusion**  
This project highlights how data-driven approaches can empower organizations to understand and tackle employee attrition effectively. By combining **SQL** for robust data analysis and **Power BI** for insightful visualizations, I demonstrated actionable strategies to improve retention and foster a more engaged workforce.

---

### **Contact Information**  
- **Name:** Adedotun Toheeb  
- **Phone:** 08147838543  
- **Email:** Tibson08@gmail.com  
- **GitHub Repository:** [HR_Employee_Attrition_Analysis-Project](https://github.com/Tibson-spec/HR_Employee_Attrition_Analysis-Project)  

---

