/*
    This SQL query retrieves the top 5 demanded skills for Data Scientist job postings that offer work from home options.
    It joins the job_postings_fact, skills_job_dim, and skills_dim tables to filter and count the occurrences of each skill.
*/


SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;