-- Run CLI
-- sqlite3 -header -box -nullvalue NULL jobs_2023.sqlite < Scripts/basics/aggregate.sql > Outputs/basics/aggregate_output.txt

SELECT
  SUM(salary_year_avg) AS salary_sum,
  COUNT(*) AS count_rows,
  COUNT(DISTINCT job_title_short) AS job_type_total
FROM
  job_postings_fact;

SELECT
  AVG(salary_year_avg) AS salary_avg_DataAnalyst,
  MIN(salary_year_avg) AS salary_min_DataAnalyst,
  MAX(salary_year_avg) AS salary_max_DataAnalyst
FROM
  job_postings_fact
WHERE
  job_title_short = 'Data Analyst';

SELECT
  job_title_short AS job_title,
  COUNT(job_title_short) as job_count,
  AVG(salary_year_avg) AS salary_avg,
  MIN(salary_year_avg) AS salary_min,
  MAX(salary_year_avg) AS salary_max
FROM
  job_postings_fact
GROUP BY
  job_title_short
HAVING
  job_count > 100
ORDER BY
  salary_avg DESC
