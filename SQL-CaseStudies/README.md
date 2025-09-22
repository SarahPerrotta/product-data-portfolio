# SQL Case Studies

### 1. New Products (StrataScratch ID 10318)  
**Objective:** 
Calculate net difference in launches between 2019 and 2020.  

**Approach:** 
Conditional aggregation with `CASE WHEN`.  

**Solution file:** [New_Products_Net_Change.sql](./New_Products_Net_Change.sql)  

**Result:**
2

**Insight:** 
Chevrolet increased launches (+2), Honda decreased (-3).  


### 2. Salaries Differences (StrataScratch ID 10308)
**Objective:**  
Calculate the absolute difference between the highest salaries in the Marketing and Engineering departments.  

**Approach:**  
- Joined `db_employee` and `db_dept` on department ID.  
- Used `CASE WHEN` with `MAX()` to extract the highest salary in each department.  
- Subtracted Engineering from Marketing and wrapped with `ABS()` to ensure a positive result.  

**Solution File:** [Salaries_Differences.sql](./Salaries_Differences.sql)  

**Result:**  
The absolute difference in the top salaries was **2400**, with **Engineering paying more** than Marketing.  

**Insight:**  
This highlights a department-level pay gap where Engineering commands higher compensation at the senior level. In a real-world setting, this could influence hiring strategies, retention, and internal equity reviews.


### 3. Finding Updated Records (StrataScratch ID 10299)
**Objective:**  
Identify the most recent salary for each employee, given that older records exist and salaries increase each year.  

**Approach:**  
- Used a `ROW_NUMBER()` window function partitioned by employee ID and ordered salaries in descending order.  
- Assigned `rn = 1` to each employee’s highest salary row.  
- Filtered with `WHERE rn = 1` to keep only the latest salary per employee.  
- Output employee ID, first/last name, department ID, and current salary, ordered by employee ID.  

**Solution File:** [Finding_Updated_Records.sql](./Finding_Updated_Records.sql)  

**Result:** Each employee is listed once with their current salary.  

**Insight:**  
This query ensures that HR/payroll reports use only the most recent salary data. It demonstrates how window functions can simplify identifying “latest” records in evolving datasets.  


### 4. Workers With The Highest Salaries (StrataScratch ID 10353)
**Objective:**  
Return the official job title(s) of employees who earn the highest salary. If multiple employees tie for the top salary, include all their titles.  

**Approach:**  
- Calculated the maximum salary, but only among employees who have official job titles (joining `worker` with `title`).  
- Filtered the `worker` table for employees whose salary equals this maximum.  
- Returned their job titles from the `title` table.  
- Ordered results alphabetically by job title for readability.  

**Solution File:** [Workers_With_Highest_Salaries.sql](./Workers_With_Highest_Salaries.sql)  

**Result:** Returned the job title(s) of the best-paid employee(s). If multiple people share the max salary, all relevant titles are included.  

**Insight:**  
This query highlights how SQL can be used to combine compensation data with job title records to analyze top-paid positions. It shows the importance of filtering by employees who have valid titles, aligning with real-world data governance rules.  


