/* Top 10 Highest Paying Data Scientist Jobs
   This query retrieves the top 10 highest paying data scientist jobs(job_location = 'Anywhere').
   It selects job details from the job_postings_fact table and joins with the company_dim table to get the company name.
   The results are ordered by salary in descending order.
*/
-- Query to find the top 10 highest paying data scientist jobs
SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.job_location,
    job_postings_fact.job_schedule_type,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_postings_fact.salary_year_avg IS NOT NULL AND
    job_location= 'Anywhere' AND
    job_title_short= 'Data Scientist'
ORDER BY
    job_postings_fact.salary_year_avg DESC
LIMIT 10;
