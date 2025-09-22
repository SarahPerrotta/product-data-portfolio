-- Case Study: Salaries Differences (StrataScratch)
-- Objective: Calculate the absolute difference between the highest salaries 
--            in the Marketing and Engineering departments.
-- Tables: db_employee (id, first_name, last_name, salary, department_id)
--         db_dept (id, department)
-- Approach: Use JOIN + CASE WHEN + MAX() + ABS()
SELECT 
  ABS(
    MAX(CASE WHEN d.department = 'Marketing' THEN e.salary END) -
    MAX(CASE WHEN d.department = 'Engineering' THEN e.salary END)
  ) AS salary_diff
FROM db_employee e
JOIN db_dept d
  ON e.department_id = d.id;

