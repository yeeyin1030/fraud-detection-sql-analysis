--TOP 5 HIGHEST TRANSACTIONS THAT ARE FRAUD
select *
from ps
where isFraud  =1
order by amount desc 
limit 5;