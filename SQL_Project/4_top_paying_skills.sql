/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 10;

/*
Here's a breakdown of the results for top paying skills for Data Analysts in 2023:
- Top Earner: The skill svn (Subversion) stands out significantly with an average salary of $400,000, which is more than double the next highest skill in the list.
- Specialized Technical Skills: Following the top spot, skills like solidity ($179,000), couchbase ($160,515), and datarobot ($155,486) command high premiums, reflecting a demand for expertise in blockchain, NoSQL databases, and automated machine learning.
- Programming & DevOps: Modern development and infrastructure tools are well-represented, including golang ($155,000), terraform ($146,734), and vmware ($147,500).
- Data Science & Analytics: Specific libraries and platforms like mxnet ($149,000), dplyr ($147,633), and twilio ($138,500) also feature among the top ten.

RESULTS

[
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  }
]