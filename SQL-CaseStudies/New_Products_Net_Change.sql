-- Case Study: New Products (StrataScratch ID 10318)
-- Objective: Calculate net difference in products launched in 2020 vs 2019.
-- Approach: Count launches in each year per company, then subtract.
-- Insight: Chevrolet +2, Honda -3 → competitive differences in product strategy.
//Accepted query on StrataScratch
SELECT
  company_name,
  COUNT(DISTINCT CASE WHEN `year` = 2020 THEN product_name END)
  - COUNT(DISTINCT CASE WHEN `year` = 2019 THEN product_name END) AS net_difference
FROM car_launches
GROUP BY company_name
ORDER BY company_name;

// Alternative solution handles potential duplicates
WITH launches AS (
  SELECT company_name, `year`
  FROM car_launches
)
SELECT
  company_name,
  COUNT(CASE WHEN `year` = 2020 THEN 1 END)
  - COUNT(CASE WHEN `year` = 2019 THEN 1 END) AS total_launch
FROM launches
GROUP BY company_name;


