create database hranalysis;

use hranalysis;

select * from abs_hr;
select * from reasons;
select * from compensation;

-- Q1. Write a SQL query to calculate the average "Transportation expense" for employees who have 
 -- a "Disciplinary failure" (1 for yes, 0 for no), and group the results by the "Education" level.
select Education, avg(`Transportation expense`) from abs_hr
where `Disciplinary failure` = 1
group by Education;

-- Write a SQL query to calculate the total "Absenteeism time in hours" for each month of absence, 
-- and sort the results by the total absenteeism time in descending order.
select `Month of absence`, sum(`Absenteeism time in hours`) as total_absenteeism_time from abs_hr
group by `Month of absence`
order by total_absenteeism_time desc;

-- Write a SQL query to find the average "Body mass index" (BMI) for employees who are social drinkers and smokers,
-- and group the results by the number of children ("Son"). Additionally, only include employees with a BMI greater than 25.
select son, avg(`Body mass index`) from abs_hr
where `Social drinker` = 1 and `Social smoker` = 1
group by Son
having avg(`Body mass index`) > 25;

-- Write a SQL query to identify the top 5 most common reasons for absence, along with the count of occurrences for each reason.
select `Reason for absence`, count(`Reason for absence`) as coo from abs_hr
group by `Reason for absence`
order by coo desc
limit  5;

-- Write a SQL query to calculate the average "Work load Average/day" for employees who have disciplinary failures (1 for yes, 0 for no
-- and group the results by the "Reason for absence".
select `Reason for absence`, avg (`Work load Average/day`) from abs_hr
where `Disciplinary failure` = 1
group by `Reason for absence`;

-- Write a SQL query to retrieve the "Reason for absence" and "comp/hr" for each employee from the tables provided, 
-- joining on the "ID" column.

select hr.ID, hr.`Reason for absence`,cm.`comp/hr`
from abs_hr as hr
join compensation as cm
on hr.ID = cm.ID
order by ID;

-- Write a SQL query to retrieve the "Month of absence" and "comp/hr" for each employee from the tables provided, 
-- joining on the "ID" column. Additionally, include only those records where the "comp/hr" is greater than 50.
select hr.ID, hr.`Month of absence` ,cm.`comp/hr` from abs_hr as hr
join compensation as cm 
on hr.ID = cm.ID
where `comp/hr` > 50
order by hr.ID desc;


/* Intermediate Query Prompt:
Write a SQL query to calculate the total "Transportation expense" for each "Reason for absence" from the "abs_hr" table,
 and display the results along with the reason for absence. */
select `Reason for absence`, sum(`Transportation expense`) from abs_hr
group by `Reason for absence`
order by `Reason for absence` asc;

/* Intermediate Query Prompt:
Write a SQL query to identify the employees who have the highest "Body mass index" (BMI) from the "Employees" table, 
along with their "ID" and "BMI" values.*/
select ID, `Body mass index` 
from abs_hr
where `Body mass index`= (
	select max(`Body mass index`)
    from abs_hr);


/* Advanced Query Prompt:
Write a SQL query to find the top 10 employees with the highest "Work load Average/day" from the "abs_hr" table,
 and display their "ID", "Work load Average/day", and corresponding "Month of absence".*/
select ID, `Work load Average/day`,`Month of absence` 
from abs_hr
order by `Work load Average/day` desc
limit 10;


/* Advanced Query Prompt:
Write a SQL query to calculate the average "Absenteeism time in hours" for each combination of "Reason for absence" and 
"Day of the week" from the "abs_hr" table, and display the results along with the reason for absence and day of the week.*/
select `Reason for absence`, `Day of the week`, avg(`Absenteeism time in hours`)
from abs_hr
group by `Reason for absence`, `Day of the week`

































