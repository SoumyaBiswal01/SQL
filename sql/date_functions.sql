/*SELECT '2024-02-19'::DATE,
    '123'::INTEGER,
    'true'::BOOLEAN,
    '3.14'::REAL;*/

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM
    job_postings_fact;


SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM
    job_postings_fact;


SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,   --moving from one time zone to another
    EXTRACT(MONTH from job_posted_date) AS date_month,
    EXTRACT(YEAR from job_posted_date) AS date_year
FROM
    job_postings_fact;


SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH from job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY 
    job_posted_count;