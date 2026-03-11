create database churning;
use churning;
select * from analysis;

# overall churn 
select 
 COUNT(*) AS total_customers,
    SUM(exited) AS churned_customers,
    AVG(exited)*100 AS churn_percentage
FROM analysis;


# churn by geography

SELECT 
    geography,
    COUNT(*) AS total_customers,
    AVG(exited)*100 AS churn_rate
FROM analysis
GROUP BY geography
ORDER BY churn_rate DESC;


# churn by age group 
select
  case 
	when age <= 30 then '18 - 30'
    when age <= 40 then '31 - 40'
    when age <= 50 then '41 - 50'
    when age <= 60 then '51 - 60'
    else '60+'
  end as age_group,
  avg(exited)*100 as churn_rate 
from analysis
group by age_group
order by churn_rate desc;

# Active vs Inactive 

select
      isactivemember,
      avg(exited)*100 as churn_rate 
from analysis
group by IsActiveMember;

# high balance
 
SELECT 
	exited,
    avg(balance) as avg_balance
from analysis
group by exited;
    
  
