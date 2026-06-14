use job_market_db;

-- 1. top 10 hiring company
-- select company_name,
-- 	count(*) as total_jobs
--     from jobs
--     group by company_name
--     order by total_jobs desc
--     limit 10;
    
-- 2. Average salary by job title 

-- select job_title, 
-- 	round(avg(salary_max),0) as avg_max_salary,
--     round(avg(salary_min),0) as avg_min_salary,
--     round(avg(salary_avg),0) as avg_salary
-- from jobs
-- group by job_title
-- order by avg_salary desc
-- limit 10;
    
-- 3️. Top 10 Locations with Most Jobs

-- select location,
-- 	count(*) as total_jobs,
-- 	round(avg(salary_avg),0) as avg_salary
-- from jobs
-- group by location
-- order by total_jobs desc
-- limit 10;

-- 4. Most In-Demand skills

-- select 'pyhton' as skills , sum(python) as demand from jobs
-- union all
-- select 'sql', sum(`sql`) from jobs
-- union all
-- select 'excel', sum(excel) from jobs
-- union all
-- select 'tableau', sum(tableau) from jobs
-- union all
-- select 'power_bi', sum(power_bi) from jobs
-- union all
-- select 'r', sum(r) from jobs
-- union all
-- select 'machine_learning', sum(machine_learning) from jobs
-- union all
-- select 'statistics', sum(statistics) from jobs
-- union all
-- select 'pandas', sum(pandas) from jobs
-- union all
-- select 'spark', sum(spark) from jobs
-- order by demand desc

-- 5. Company Rating vs Salary (Are better companies paying more?)

-- select 
-- case
-- 	when rating>=4.5 then 'Excelent(>4.5+)'
-- 	when rating>=4.0 then 'Good(>4.0+)'
--     when rating>=3.0 then 'Average(>3.0+)'
--     else 'below average(<3.0)'
--     end as company_rating_category,
--     count(*) as total_jobs,
--     round(avg(salary_avg),0) as avg_salary
--     from jobs
--     group by company_rating_category
--     order by avg_salary desc;

-- 6. Jobs Requiring Python vs SQL vs Both
-- select
-- 	sum(case when python =1 and `sql`=0 then 1 else 0 end) as Python_only, 
--     sum(case when `sql`=1 and python=0 then 1 else 0 end) as Sql_only,
--     sum(case when python =0 and `sql`=0 then 1 else 0 end) as neither,
--     sum(case when python =1 and `sql`=1 then 1 else 0 end) as both_Python_sql
-- from jobs;

-- 7. Salary Range Distribution

-- select
-- 	case
-- 		when salary_avg <50000 then 'under $50k'
-- 		when salary_avg between 50000 and 70000 then '$50k-$70k'
-- 		when salary_avg between 70001 and 90000 then '$70k-$90k'
-- 		when salary_avg between 90001 and 110000 then '$00k-$110k'
-- 		else 'Above $110k'
-- 	end as salary_range,
-- 	count(*) as total_jobs
-- from jobs
-- where salary_avg is not null
-- group by salary_range
-- order by total_jobs desc;

-- 8. Top Skills for HIGH Paying Jobs (above avg salary)

-- select 
-- round(avg(salary_avg),0)as avg_salary,
-- sum(`sql`) as sql_jobs,
-- sum(excel) as excel_jobs,
-- sum(tableau) as tableau_jobs,
-- sum(power_bi) as power_bi_jobs,
-- sum(r) as r_jobs,
-- sum(machine_learning) as machine_learning_jobs,
-- sum(pandas) as pandas_jobs,
-- sum(spark) as spark_jobs 
-- from jobs
-- where salary_avg> (select avg(salary_avg) from jobs);

-- 9. Skill Gap Finder by Job Title
select job_title,
count(*) as total_jobs,
sum(`sql`) as sql_need,
sum(excel) as excel_need,
sum(tableau) as tableau_need,
sum(power_bi) as power_bi_need,
sum(r) as r_need,
sum(machine_learning) as machine_learning_need,
sum(pandas) as pandas_need,
sum(spark) as spark_need, 
round(avg(salary_avg),0)as avg_salary
from jobs
group by job_title
order by total_jobs
desc;

-- 10. Top 10 Highest Paying Job Locations

select
    location,
    count(*) as job_count,
    round(avg(salary_avg), 0) as avg_salary,
    round(avg(rating), 2) as avg_company_rating
from jobs
where salary_avg is not null
group by location
having count(*) > 5
order by avg_salary desc
limit 10;






