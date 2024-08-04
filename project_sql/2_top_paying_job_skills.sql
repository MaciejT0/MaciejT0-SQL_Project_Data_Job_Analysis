/*
Qusetios: What skills are required for the top-paying data analyst jobs located in Poland?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It will provide detail look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/
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

/*
Here are the insights into the skills required for the top 10 data analyst roles in Poland for year 2023:

SQL is the most frequently required skill, appearing in 9 of the job postings.
Google Cloud Platform (GCP) is also highly demanded, mentioned in 7 postings.
Python is listed in 5 job postings.
Tableau and Looker are each mentioned in 4 postings.
Windows is required in 3 postings.
Excel and PySpark appear in 2 postings each.
Several other skills are mentioned once each, including:
-SAP
-Git
-Flow
-Spark
-Scikit-learn
-Hadoop
-BigQuery
-Airflow
-PowerPoint
These insights indicate a strong emphasis on SQL, cloud platforms like GCP, and popular data analysis and visualization tools such as Python, Tableau, and Looker.

[
  {
    "job_id": 369283,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 369283,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 369283,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "gcp"
  },
  {
    "job_id": 369283,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "airflow"
  },
  {
    "job_id": 369283,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "windows"
  },
  {
    "job_id": 369283,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "job_id": 369283,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Delivery Experience Technology & Product)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "looker"
  },
  {
    "job_id": 876513,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Financial Services",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 876513,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Financial Services",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "gcp"
  },
  {
    "job_id": 876513,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Financial Services",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "windows"
  },
  {
    "job_id": 876513,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Financial Services",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "job_id": 876513,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst - Financial Services",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "looker"
  },
  {
    "job_id": 367763,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 367763,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 367763,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "bigquery"
  },
  {
    "job_id": 367763,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "job_id": 1240464,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Capco",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "sql"
  },
  {
    "job_id": 1240464,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Capco",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "python"
  },
  {
    "job_id": 1240464,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Capco",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "gcp"
  },
  {
    "job_id": 1240464,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Capco",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "spark"
  },
  {
    "job_id": 1240464,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Capco",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "pyspark"
  },
  {
    "job_id": 1240464,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Capco",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1240464,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Capco",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 1240464,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Capco",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "excel"
  },
  {
    "job_id": 1240464,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Capco",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "flow"
  },
  {
    "job_id": 1281562,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (CX Tech)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "sql"
  },
  {
    "job_id": 1281562,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (CX Tech)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "python"
  },
  {
    "job_id": 1281562,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (CX Tech)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "windows"
  },
  {
    "job_id": 1281562,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (CX Tech)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "tableau"
  },
  {
    "job_id": 1281562,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (CX Tech)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "looker"
  },
  {
    "job_id": 1281562,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (CX Tech)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "102500.0",
    "skills": "git"
  },
  {
    "job_id": 470832,
    "job_title_short": "Data Analyst",
    "job_title": "SAP Finance Data Analyst",
    "company_name": "Westinghouse Electric Company",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "77017.5",
    "skills": "excel"
  },
  {
    "job_id": 470832,
    "job_title_short": "Data Analyst",
    "job_title": "SAP Finance Data Analyst",
    "company_name": "Westinghouse Electric Company",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "77017.5",
    "skills": "sap"
  },
  {
    "job_id": 470832,
    "job_title_short": "Data Analyst",
    "job_title": "SAP Finance Data Analyst",
    "company_name": "Westinghouse Electric Company",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "77017.5",
    "skills": "powerpoint"
  },
  {
    "job_id": 189127,
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst (Campaign Team)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "75067.5",
    "skills": "sql"
  },
  {
    "job_id": 189127,
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst (Campaign Team)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "75067.5",
    "skills": "gcp"
  },
  {
    "job_id": 189127,
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst (Campaign Team)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "75067.5",
    "skills": "looker"
  },
  {
    "job_id": 705215,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Pricing)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "57500.0",
    "skills": "sql"
  },
  {
    "job_id": 705215,
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Pricing)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "57500.0",
    "skills": "gcp"
  },
  {
    "job_id": 282943,
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst - e-Xperience 2023",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "53014.0",
    "skills": "sql"
  },
  {
    "job_id": 282943,
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst - e-Xperience 2023",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "53014.0",
    "skills": "python"
  },
  {
    "job_id": 282943,
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst - e-Xperience 2023",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "53014.0",
    "skills": "gcp"
  },
  {
    "job_id": 282943,
    "job_title_short": "Data Analyst",
    "job_title": "Junior Data Analyst - e-Xperience 2023",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "53014.0",
    "skills": "pyspark"
  },
  {
    "job_id": 67765,
    "job_title_short": "Data Analyst",
    "job_title": "Junior/Mid/Senior Data Analyst (Pricing)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "53014.0",
    "skills": "sql"
  },
  {
    "job_id": 67765,
    "job_title_short": "Data Analyst",
    "job_title": "Junior/Mid/Senior Data Analyst (Pricing)",
    "company_name": "Allegro",
    "job_location": "Poland",
    "job_schedule_type": "Full-time",
    "job_work_from_home": false,
    "salary_year_avg": "53014.0",
    "skills": "gcp"
  }
]
*/