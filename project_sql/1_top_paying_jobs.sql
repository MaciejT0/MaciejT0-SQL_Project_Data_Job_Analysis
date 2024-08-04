/*
Question: What are the top-paying data analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are available in Poland.
-Focus on job postings with specified slaries (remove nulls).
-Why? Highlight the top-paying opportunities for Data Analyst, offering insights into employment options.
*/

SELECT 
    job_id,
    job_title_short,
    job_title,
    company_dim.name AS company_name,
    job_location,
    job_schedule_type,
    job_work_from_home,
    salary_year_avg
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Poland' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10