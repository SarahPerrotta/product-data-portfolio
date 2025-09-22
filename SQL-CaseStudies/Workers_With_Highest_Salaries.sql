-- Case Study: Workers With The Highest Salaries (StrataScratch ID 10353)
-- Objective:
--   Return the job title(s) of employees who earn the highest salary,
--   considering only employees with official titles.
--
-- Why this pattern:
--   The MAX(salary) must be computed over the subset of workers who have titles.
--   Joining worker→title inside the subquery ensures untitled workers are excluded
--   from the max calculation, which matches the prompt.
--
-- Notes:
--   - ORDER BY is ignored by the checker, but kept for readability.
--   - A DISTINCT variant can be used in portfolios to de-duplicate identical titles
--     when multiple best-paid workers share the same title (platform may or may not require it).
SELECT b.worker_title AS best_paid_title
FROM worker a
JOIN title b
  ON a.worker_id = b.worker_ref_id
WHERE a.salary = (
  SELECT MAX(w.salary)
  FROM worker w
  JOIN title t
    ON w.worker_id = t.worker_ref_id
)
ORDER BY best_paid_title;
