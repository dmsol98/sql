-- Run from CLI in parent directory
-- sqlite3 -header -box -nullvalue NULL jobs_2023.sqlite < Scripts/basics/join.sql > Outputs/basics/join_output.txt

SELECT
  job_postings.job_id,
  job_postings.job_title_short,
  companies.name AS company_name
FROM
  job_postings_fact AS job_postings
LEFT JOIN company_dim AS companies
  ON job_postings.company_id = companies.company_id
LIMIT
  15;

SELECT
  job_postings.job_id,
  job_postings.job_title_short,
  companies.name AS company_name
FROM
  job_postings_fact AS job_postings
RIGHT JOIN company_dim AS companies
  ON job_postings.company_id = companies.company_id
LIMIT
  15;

SELECT
  job_postings.job_id,
  job_postings.job_title_short,
  skills.skills
FROM
  job_postings_fact AS job_postings
INNER JOIN skills_job_dim AS skills_to_job 
  ON job_postings.job_id = skills_to_job.job_id
INNER JOIN skills_dim AS skills 
  ON skills_to_job.skill_id = skills.skill_id
LIMIT
  15;
