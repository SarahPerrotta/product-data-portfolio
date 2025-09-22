-- Case Study: Finding Updated Records (StrataScratch ID 10299)
-- Objective:
--   Retrieve the most recent (current) salary for each employee,
--   given that older salary records exist and salaries increase each year.
--
-- Approach:
--   - Use ROW_NUMBER() window function to rank salaries per employee (highest = 1).
--   - Partition by employee ID to evaluate each employee separately.
--   - Order salaries in descending order to place the latest salary first.
--   - Filter with WHERE rn = 1 to keep only the most recent salary record per employee.
--   - Output employee ID, name, department ID, and current salary.
--   - Order final results by employee ID ascending.
--
-- Insight:
--   This query ensures HR/payroll data reflects only the latest salary,
--   a common need when cleaning or reporting on evolving employee records.

WITH ranked AS (
  SELECT
    id,
    first_name,
    last_name,
    department_id,
    salary,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY salary DESC) AS rn
  FROM ms_employee_salary
)
SELECT
  id,
  first_name,
  last_name,
  department_id,
  salary AS current_salary
FROM ranked
WHERE rn = 1
ORDER BY id;
