/* 
    This query retrieves the top 25 skills that lead to the highest average salary for Data Scientist positions that offer work-from-home options.
    It joins the job postings fact table with the skills dimension and filters for Data Scientist roles with work-from-home options.
    The results are grouped by skill and ordered by average salary in descending order.
*/


SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
