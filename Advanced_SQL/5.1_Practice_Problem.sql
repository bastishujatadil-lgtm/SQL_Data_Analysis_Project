/*
Find the job postings from first quarter that have a salary greater than $70K
- Combine job postings tables from the first quarter of 2023 (Jan - Mar)
- Get job postings with an average yearly salary > $70,000
*/

WITH quarter_1_jobs AS (
    SELECT *
FROM
    january_jobs

UNION ALL

SELECT *
FROM
    february_jobs

UNION ALL

SELECT *
FROM
    march_jobs
)

SELECT
    job_id,
    job_title_short,
    job_location,
    salary_year_avg,
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month
FROM
    quarter_1_jobs
WHERE
    salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;

/* Method 2:

SELECT
    quarter_1_jobs.job_title_short,
    quarter_1_jobs.job_location,
    quarter_1_jobs.job_via,
    quarter_1_jobs.job_posted_date::DATE,
    quarter_1_jobs.salary_year_avg
FROM
    (
    SELECT *
    FROM
        january_jobs

    UNION ALL

    SELECT *
    FROM
        february_jobs

    UNION ALL

    SELECT *
    FROM
        march_jobs
) AS quarter_1_jobs
WHERE
    quarter_1_jobs.salary_year_avg > 70000 AND
    quarter_1_jobs.job_title_short = 'Data Analyst'
ORDER BY
    quarter_1_jobs.salary_year_avg DESC;
*/
