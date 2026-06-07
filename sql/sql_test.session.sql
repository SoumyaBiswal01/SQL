CREATE TABLE job_applied(
    job_ID INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

--INSERT

INSERT INTO job_applied(
    job_ID,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status)
VALUES(
    1,
    '2024-02-01',
    true,
    'resume_01.pdf',
    true,
    'cover_letter_01.pdf',
    'submitted'),
    (
    2,
    '2024-03-01',
    false,
    'resume_02.pdf',
    false,
    NULL,
    'interview scheduled'
    ),
    (
    3,
    '2024-02-03',
    true,
    'resume_03.pdf',
    true,
    'cover_letter_03.pdf',
    'ghosted'
    ),
    (
    4,
    '2024-02-04',
    true,
    'resume_01.pdf',
    false,
    NULL,
    'submitted'
    ),
    (5,
    '2024-02-05',
    false,
    'resume_01.pdf',
    true,
    'cover_letter_01.pdf',
    'rejected');

SELECT *
FROM job_applied
ORDER BY
    job_id;

--Alter

ALTER TABLE job_applied
ADD contact VARCHAR(50);

ALTER TABLE job_applied
ALTER COLUMN contact TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact;
--similarly, drop table

--update (modify existing data)

UPDATE job_applied
SET contact = 'ABS'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Aqeqr'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Aafrg'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'ges'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'wg'
WHERE job_id = 5;