/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrievies the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers
*/

SELECT
    skills,
    COUNT(*) AS skill_count
FROM job_postings_fact

INNER JOIN (
        SELECT
            job_id,
            skills_job_dim.skill_id,
            skills
        FROM skills_job_dim
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
) AS skills_to_job_dim ON job_postings_fact.job_id = skills_to_job_dim.job_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills_to_job_dim.skills
ORDER BY
    skill_count DESC
LIMIT 5
