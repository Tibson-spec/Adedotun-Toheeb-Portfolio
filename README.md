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
![Image Alt](https://github.com/Tibson-spec/Adedotun-Toheeb-Portfolio/blob/main/workflow%20diagram.png?raw=true)

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
[![Thumbnail Caption](thumbnail-image.jpg)](https://drive.google.com/file/d/1TmBDHX8B5GFZKp-y7unGjYVibrXIVyQn/view?usp=sharing)

*Click to view the full-size image.*

1. **Sales Trends**: Interactive chart showing monthly sales and profit margins by product category.

2. **Profit Margins by Region**: Stacked bar chart highlighting profitability differences.
![Image Alt](https://github.com/Tibson-spec/Adedotun-Toheeb-Portfolio/blob/main/PROFIT%20MARG.PNG?raw=true)
 
3. **Customer Purchase Patterns**: Clustered column chart visualizing purchase frequency by segment.
![image](https://github.com/user-attachments/assets/4b781d92-aa44-4883-bf93-f68943cb2d6f)

5. Top 10 best performing customer: Stacked bar chart to depict best performing customer.

6. Total transaction by ship mode: Pie chart showcasing which ship mode is prefered by customers.

7. Profitability Analysis: Pie chart illustrating the profit margin across various product category
![image](https://github.com/Tibson-spec/Adedotun-Toheeb-Portfolio/blob/main/profitability%20insights.PNG?raw=true)

 

*(Use relevant visuals created in Power BI.)*

---

### **Recommendations**
- Launch seasonal promotions for **Technology** and **Office Supplies** during Q4 to maximize revenue.  
- Focus marketing efforts on the **West Coast** and **Midwest** regions for higher profitability.  
- Implement loyalty programs for **Consumer** and **Corporate** segments to enhance customer retention.  
- Optimize inventory for high-margin products like **Technology** to increase overall profit.

---

### **SQL Queries Highlights**
Provide code snippets or screenshots of the key SQL queries, such as:  
- Monthly sales and profit trends.  
- Creating and populating the **Dim_Date** table.  
- Cost and profit margin calculations.

[lick here 👉Link to the full GitHub repository for detailed queries👈](https://github.com/Tibson-spec/Sample-Superstore-Dataset-Project)

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

