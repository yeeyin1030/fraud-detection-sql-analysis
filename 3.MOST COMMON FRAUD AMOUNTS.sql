--MOST COMMON FRAUD AMOUNTS
select amount, count(*) as total_amount
from ps
where isFraud = 1
group by amount 
order by total_amount desc
limit 10;