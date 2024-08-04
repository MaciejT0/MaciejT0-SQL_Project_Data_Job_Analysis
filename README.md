# Introduction
Dive into the data job market! Focusing on data analyst roles, this project explores top-paying jobs, in-demand skills and where high demand meets high salary in data analytics.

SQL queries: [project_sql folder](/project_sql/)
# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, stremlining others work to find optimal jobs.

Data hails from (https://lukebarousse.com/sql). It's packed with insights on job titles, salaries, locations and essential skills.

### The questions I wanted to answer through my SQL queries were:
1. What are the top-paying data analyst jobs in Poland?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts worldwide?
4. Which skills are associated with higher salary?
5. What are the most optimal skills to learn?
# Tools I Used
For my deep dive into the data analyst job market, I used several key tools:

- **SQL:** Used to query the database and enearth critical insights.
- **PostgreSQL:** The chosen database menagement system.
- **Visual Studio Code:** Used for database menagment and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market.
Here's how I approached each question:
### 1. Top Paying Data Analyst Jobs in Poland
To identify the highest-paying jobs, I filtered data analyst positions by average yearly salary and location, focusing on jobs located in Poland. This query highlights the high paying opportunities in the field.

```sql
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
```
Here is the breakdown of the top data analyst jobs in 2023:
- **Salary Range:** Top 10 paying data analyst roles in Poland span from $53,014 to $111,175 indicating medium salary potential in the field.
- **Limited Employers:** 8 out of 10 top-paying data analyst jobs in Poland have been offered by Allegro company, showing limited job opportunities in this country.
- **Remote Working:** In all of the highest-paying job postings in Poland on data analyst roles, work can't be performed from remote locations.

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined job postings with skill data, providing insights into what employers balue for high-compensation roles.

```sql
SELECT
    top_paying_jobs_poland.*,
    skills,
FROM (
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
) AS top_paying_jobs_poland

INNER JOIN (
        SELECT
            job_id,
            skills_job_dim.skill_id,
            skills
        FROM skills_job_dim
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
) AS skills_to_job_dim ON top_paying_jobs_poland.job_id = skills_to_job_dim.job_id
```

Here's the breakdown of the most demanded skills for the top 10 highest paying data jobs in Poland for year 2023:
- **SQL** is the most frequently required skill, appearing in 9 of the job postings.
- **Google Cloud Platform (GCP)** is also highly demanded, mentioned in 7 postings.
- **Python** is listed in 5 job postings.
- **Tableau and Looker** are each mentioned in 4 postings.

These insights indicate a strong emphasis on SQL, cloud platforms like GCP, and popular data analysis and visualization tools such as Python, Tableau, and Looker.

### 3. In-Demand Skills for Data Analysts
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
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
```
Here's the breakdown of the most demanded skills for data analysts in 2023
- **SQL** and **Excel** remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation
- **Programming** and **Visualization Tools** like **Python**, **Tableau**, and **Power BI** are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

| Skills   | Skill Count |
|----------|-------------|
| SQL      | 92628       |
| Excel    | 67031       |
| Python   | 57326       |
| Tableau  | 46554       |
| Power BI | 39468       |

*Table of the demand for top 5 skills in data analyst job postings*
### 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.
```sql
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS average_salary
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
    salary_year_avg IS NOT NULL AND
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25
```
Breakdown of the results from top paying skills for data analysts:
- **Emerging Technologies and Deep Learning:** High salaries for skills in blockchain (Solidity), AutoML (DataRobot), and deep learning frameworks (MXNet, Keras, PyTorch) indicate the premium placed on expertise in cutting-edge technologies driving AI and automation advancements.

- **Big Data and Real-time Analytics:** Skills in NoSQL databases (Couchbase, Cassandra) and stream processing tools (Kafka) are highly valued, reflecting the need to manage and analyze large volumes of data efficiently and in real-time.

- **DevOps and Infrastructure Automation:** High demand and salaries for skills in infrastructure as code tools (Terraform, Puppet, Ansible) and cloud/virtualization technologies (VMware) highlight the importance of automating and scaling IT operations in modern enterprises.

| Skills        | Average Salary |
|---------------|----------------|
| svn           | 400000.00      |
| solidity      | 179000.00      |
| couchbase     | 160515.00      |
| datarobot     | 155485.50      |
| golang        | 155000.00      |
| mxnet         | 149000.00      |
| dplyr         | 147633.33      |
| vmware        | 147500.00      |
| terraform     | 146733.83      |
| twilio        | 138500.00      |

*Table of the average salary for top 10 paying skills for data analysts*

### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.
```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```

| Skill ID | Skills     | Demand Count | Avg Salary |
|----------|------------|--------------|------------|
| 8        | go         | 27           | 115320     |
| 234      | confluence | 11           | 114210     |
| 97       | hadoop     | 22           | 113193     |
| 80       | snowflake  | 37           | 112948     |
| 74       | azure      | 34           | 111225     |
| 77       | bigquery   | 13           | 109654     |
| 76       | aws        | 32           | 108317     |
| 4        | java       | 17           | 106906     |
| 194      | ssis       | 12           | 106683     |
| 233      | jira       | 20           | 104918     |

*Table of the most optimal skills for data analyst sorted by salary*

Here's breakdown of the most optimal skills for Data Analysts in 2023:
- **High-Demand Programming Languages:** Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand, their average salaries are around $101,397 for Python and $100,499 for R, indicating that proficiency in these languages is highly valued but also widely available.
- **Cloud Tools and Technologies:** Skills in specialized technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
- **Business Intelligence and Visualization Tools:** Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries around $99,288 and $103,795, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
- **Database Technologies:** The demand for skills in traditional and NoSQL databases (Oracle, SQL Server, NoSQL) with average salaries ranging from $97,786 to $104,534, reflects the enduring need for data storage, retrieval, and management expertise.
# What I learned
Throughout this project, I've learned:
- **Crafting Queries:** - Learned a lot about how to manipulate and join tables, as well as writing more advanced queries using subqueries and  CET's.
- **Data Aggregation:** - Now I better understand how to use aggregate functions like COUNT() and AVG() in process of analyzing the data.
- **Analytics:** - Overall I increased my solving skills, by turning questions into actionable SQL queries.

# Conclusions

### Insights
From the analysis several general insights emerged:

1. **Top Paying Data Analyst Jobs in Poland**: There is limited choice in regards to data analyst jobs in Poland as most of the highest-paying offers comes from Allegro company.
2. **Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it's critical skill for earning a top salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries**: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts
This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.