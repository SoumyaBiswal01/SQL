SELECT
    company_id,
    name AS company_name
FROM company_dim
WHERE
    company_id IN (
        SELECT
            company_id
            --job_no_degree_mention
        FROM
            job_postings_fact
        WHERE
            job_no_degree_mention = TRUE
        ORDER BY
            company_id
    )


SELECT * FROM company_dim

--CTE (common table expression)
-- defined using WITH statement before it

/*  Find the comapanies that have the most job openings.
- Get the total number of job openings per comapny id (job_posting_fact)
- Return the toal number of jobs with the company name (company_dim)
*/


/* MY answer (WRONG!!)

SELECT
    name as comapny_name
FROM
    company_dim
WITH company_job_count AS(
    company_id,
    COUNT(*)
FROM
    job_postings_fact
GROUP BY
    company_id
)
*/


WITH company_job_count AS(
SELECT
    company_id,
    COUNT(*) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
)

SELECT company_dim.name AS company_name,
    company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN company_job_count ON 
    company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC



--Practice Problem

/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name and count of postings requiring the skill
*/

SELECT 
    skill_id,
    COUNT(*) AS skill_count
FROM skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_to_job.job_id
WHERE   
    job_postings_fact.job_work_from_home = TRUE
GROUP BY
    skill_id


SELECT * FROM skills_dim

