# Project 1
# Project Title: E-commerce Sales Analysis Project

### Overview
A comprehensive analysis of e-commerce sales data to identify revenue-driving insights, uncover trends, and understand customer behavior. By leveraging SQL, Power BI, and Excel, this project delivers actionable insights to improve inventory planning, pricing strategies, and marketing efforts.

### Project Goals
Uncover seasonal sales trends and yearly patterns.
Assess profitability by product category and region.
Segment customers for personalized marketing.

### Tools Used

SQL Server: Advanced querying, data modeling, and relationship building.
Power BI: Interactive visualizations and dashboard creation.
Excel: Data cleaning and normalization.

### Methodology
Data Preparation with Excel
Data preparation involved cleaning and standardizing datasets for effective SQL analysis:
Removed duplicates, standardized columns, and handled missing values.
Normalized datasets by creating separate tables (Orders, Products, Customers).
Final cleaned data was saved as Excel files for import into SQL Server.
SQL Data Modeling and Analysis
Creating Relationships:

Established relationships between Order Details, Products, and Customers tables using primary keys.
Added a Cost field to enable profit margin calculations.
Date Dimension Table:

Created a date dimension to enable time-series analysis on a monthly, quarterly, and yearly basis.
Key Queries:

Sales Trends: Analyzed monthly, quarterly, and yearly sales trends.
Profit Margins: Calculated profit by product category to identify high and low-margin items.
Customer Segmentation: Analyzed customer behavior by region and product preference.
SQL Code Samples:

View SQL scripts on GitHub for data manipulation and analysis.
Data Visualization with Power BI
Built interactive dashboards for stakeholders, highlighting key trends and metrics:

Sales Trends Dashboard: Shows sales performance by month, quarter, and year.
Profitability Dashboard: Visualizes profit margins by product category.
Customer Behavior Dashboard: Segments customers by region and product category.
Key Insights and Recommendations
Seasonal Inventory Management

Insight: Sales spike in Q4 and dip in Q2.
Recommendation: Increase Q4 inventory, introduce Q2 discount campaigns to boost sales.
Profit Margin Improvement

Insight: High-selling items with low margins affect profitability.
Recommendation: Renegotiate supplier prices or adjust product pricing.
Customer-Centric Marketing

Insight: Regional differences in product popularity.
Recommendation: Customize promotions by region for better engagement and retention.
Project Outcomes
15% increase in projected seasonal sales based on proposed inventory and discount strategies.
5% reduction in acquisition costs by renegotiating prices for low-margin products.
Explore the Project on GitHub
SQL Scripts: All SQL queries used for analysis are documented with context and stored in the SQL folder.
Power BI Dashboard: View the Power BI .pbix file in the Visualizations folder, including interactive charts for sales and profitability.
Data Files: Cleaned and normalized Excel files are available in the Data folder.
GitHub Repository: README.md Structure
On GitHub, you’ll want a clear and organized README that presents your analysis approach and files available for review. Below is an outline for a strong README file that complements the portfolio website.

E-commerce Sales Analysis Project
Project Summary
An analysis of e-commerce sales data using SQL, Power BI, and Excel, focusing on uncovering sales trends, profitability insights, and customer behavior. Key findings support strategic recommendations for promotions, inventory planning, and cost control.

Table of Contents
Project Objectives
Datasets
Technologies
Data Preparation in Excel
SQL Analysis
Power BI Visualization
Insights and Recommendations
How to Use this Repository

Insights and Recommendations
Seasonal Promotions
Insight: Q4 sales peak; Q2 needs discounts to maintain volume.
Profit Optimization
Insight: Improve margins on low-profit items by renegotiating or adjusting prices.
Targeted Marketing
Insight: Regional marketing can boost customer engagement.
How to Use this Repository
Data Preparation: Review Excel files in Data for the initial datasets.
SQL Analysis: Check SQL scripts in SQL for all analysis steps.
Power BI Dashboard: Open .pbix in Visualizations to explore interactive charts.
Conclusion
This project demonstrates e-commerce data analysis with a focus on SQL and Power BI for actionable insights. By cleaning data in Excel, modeling and querying in SQL, and creating visuals in Power BI, this project showcases a well-rounded approach to data analysis for business decision-making.





# Adedotun-Toheeb-Portfolio
# Project 1
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
- **Source:Public HR dataset containing 1,470 employee records.  
- **Features Analyzed:**  
  - **Demographics:** Age, gender, marital status.  
  - **Job Details:** Job role, monthly income, satisfaction levels.  
  - **Attrition Factors:** Overtime, work-life balance, distance from home.  

---

### **Tools & Technologies**  
- **SQL Server:For data cleaning, querying, and exploratory analysis.  
- **Power BI:For creating dynamic, interactive dashboards with DAX calculations.  
- **Excel:** Pre-processing and initial data exploration.  

---

### **Process Breakdown**  

#### 1. SQL Data Analysis 
The first step was cleaning and analyzing the dataset using SQL queries.  

- **Data Cleaning: 
  ```sql
  SELECT *  
  FROM Employees  
  WHERE MonthlyIncome IS NOT NULL;  
  ```  

- **Key Queries:**  
  - **Attrition by Monthly Income:**  
    ```sql
    SELECT MonthlyIncome, COUNT(*) AS AttritionCount  
    FROM Employees  
    WHERE Attrition = 'Yes'  
    GROUP BY MonthlyIncome  
    ORDER BY AttritionCount DESC;  
    ```  

  - **Work-Life Balance vs. Attrition:**  
    ```sql
    SELECT WorkLifeBalance, COUNT(*) AS AttritionCount  
    FROM Employees  
    WHERE Attrition = 'Yes'  
    GROUP BY WorkLifeBalance;  
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

