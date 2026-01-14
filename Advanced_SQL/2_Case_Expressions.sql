/*
Label new column as follows:
- 'Anywhere' jobs as 'Remote'
- 'New York,NY' jobs as 'Local'
- Otherwise 'Onsite'
- For Data Analyst positions only
- Count number of jobs in each category
*/
SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;