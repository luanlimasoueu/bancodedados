SET @var_string = 'my_var';
SET @var_num = '2';
SET @var_date = '2015-07-20';

select @var_date;

SET @start_date = '2015-07-20';
SET @end_date = '2016-01-31';
#this gets the year month value to use as the partition names
SET @start_yearmonth = (SELECT EXTRACT(YEAR_MONTH FROM @start_date));
SET @end_yearmonth = (SELECT EXTRACT(YEAR_MONTH FROM @end_date));

SELECT @start_yearmonth;


CREATE TABLE team_person AS SELECT 'A' team, 'John' person
UNION ALL SELECT 'B' team, 'Smith' person
UNION ALL SELECT 'A' team, 'Walter' person
UNION ALL SELECT 'A' team, 'Louis' person
UNION ALL SELECT 'C' team, 'Elizabeth' person
UNION ALL SELECT 'B' team, 'Wayne' person;


SELECT * FROM team_person;

SET @row_no := 0;
SELECT @row_no := @row_no + 1 AS row__number, team, person
FROM team_person;

SELECT @row_no := IF(@prev_val = t.team, @row_no + 1, 1) AS row__number
,@prev_val := t.team AS team
,t.person
FROM team_person t,
(SELECT @row_no := 0) x,
(SELECT @prev_val := '') y
ORDER BY t.team ASC,t.person DESC;



