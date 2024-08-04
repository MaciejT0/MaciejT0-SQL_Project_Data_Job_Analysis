/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analyst and
helps identify the most financially rewarding skills to acquire or improve
*/

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

/*
Emerging Technologies and Deep Learning: High salaries for skills in blockchain (Solidity), AutoML (DataRobot), and deep learning frameworks (MXNet, Keras, PyTorch) indicate the premium placed on expertise in cutting-edge technologies driving AI and automation advancements.

Big Data and Real-time Analytics: Skills in NoSQL databases (Couchbase, Cassandra) and stream processing tools (Kafka) are highly valued, reflecting the need to manage and analyze large volumes of data efficiently and in real-time.

DevOps and Infrastructure Automation: High demand and salaries for skills in infrastructure as code tools (Terraform, Puppet, Ansible) and cloud/virtualization technologies (VMware) highlight the importance of automating and scaling IT operations in modern enterprises.
[
  {
    "skills": "svn",
    "average_salary": "400000.00"
  },
  {
    "skills": "solidity",
    "average_salary": "179000.00"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "average_salary": "155485.50"
  },
  {
    "skills": "golang",
    "average_salary": "155000.00"
  },
  {
    "skills": "mxnet",
    "average_salary": "149000.00"
  },
  {
    "skills": "dplyr",
    "average_salary": "147633.33"
  },
  {
    "skills": "vmware",
    "average_salary": "147500.00"
  },
  {
    "skills": "terraform",
    "average_salary": "146733.83"
  },
  {
    "skills": "twilio",
    "average_salary": "138500.00"
  },
  {
    "skills": "gitlab",
    "average_salary": "134126.00"
  },
  {
    "skills": "kafka",
    "average_salary": "129999.16"
  },
  {
    "skills": "puppet",
    "average_salary": "129820.00"
  },
  {
    "skills": "keras",
    "average_salary": "127013.33"
  },
  {
    "skills": "pytorch",
    "average_salary": "125226.20"
  },
  {
    "skills": "perl",
    "average_salary": "124685.75"
  },
  {
    "skills": "ansible",
    "average_salary": "124370.00"
  },
  {
    "skills": "hugging face",
    "average_salary": "123950.00"
  },
  {
    "skills": "tensorflow",
    "average_salary": "120646.83"
  },
  {
    "skills": "cassandra",
    "average_salary": "118406.68"
  },
  {
    "skills": "notion",
    "average_salary": "118091.67"
  },
  {
    "skills": "atlassian",
    "average_salary": "117965.60"
  },
  {
    "skills": "bitbucket",
    "average_salary": "116711.75"
  },
  {
    "skills": "airflow",
    "average_salary": "116387.26"
  },
  {
    "skills": "scala",
    "average_salary": "115479.53"
  }
]
*/