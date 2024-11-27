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

