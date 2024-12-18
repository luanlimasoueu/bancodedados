CREATE TABLE example
(`applicant_id` INT, `company_name` VARCHAR(255), `end_date` DATE);

select * from example

INSERT INTO example(applicant_id, company_name, end_date) values ( 1, 'Google', null), (1, 'Initech', '2013-01-31'), (2, 'Woodworking.com', '2016-08-25'), (3, 'Times' ,'2013-11-10');

select * from example

SELECT * FROM example WHERE end_date > '2016-01-01';

SELECT * FROM example WHERE end_date > '2016-01-01' OR end_date IS NULL;

SELECT applicant_id, MAX(end_date) FROM example GROUP BY applicant_id;


SELECT
applicant_id,
CASE WHEN MAX(end_date is null) = 1 THEN 'present' ELSE MAX(end_date) END
max_date
FROM example
GROUP BY applicant_id;


SELECT
data.applicant_id,
data.company_name,
data.max_date
FROM (
SELECT
*,
CASE WHEN end_date is null THEN 'present' ELSE end_date END max_date
FROM example
) data
INNER JOIN (
SELECT
applicant_id,
CASE WHEN MAX(end_date is null) = 1 THEN 'present' ELSE MAX(end_date) END max_date
FROM
example
GROUP BY applicant_id
) j
ON data.applicant_id = j.applicant_id AND data.max_date = j.max_date;
