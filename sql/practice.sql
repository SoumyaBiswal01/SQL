CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date)=1
    LIMIT 10;

CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date)=2
    LIMIT 10;

CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date)=3
    LIMIT 10;

SELECT * FROM january_jobs;