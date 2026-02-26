-- Run from CLI in parent directory
-- sqlite3 -header -box -nullvalue NULL invoices_2023.sqlite < Scripts/practice/prac3.sql > Outputs/practice/prac3_output.txt

/*
- Calculates the current month's total expenses per project
- Calculate a scenario where the hourly rate increases by $5

Goals:
- See the difference of raising the hourly rate
- Figure out what is a reasonable raise
*/

SELECT
  project_id,
  ROUND(hours_rate, 2) AS rate_original,
  ROUND(hours_rate + 5, 2) AS rate_hike,
  ROUND(SUM(hours_spent * hours_rate), 2) AS prj_cost_original,
  ROUND(SUM(hours_spent * (hours_rate + 5)), 2) AS prj_cost_projected
FROM
  invoices_fact
GROUP BY
  project_id
LIMIT
  20;
