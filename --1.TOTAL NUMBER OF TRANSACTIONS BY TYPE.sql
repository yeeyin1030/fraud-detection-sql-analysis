--TOTAL NUMBER OF TRANSACTIONS BY TYPE
select type, count(*) as total_transactions,
round(sum(amount),2) as total_amount 
from ps
group by type
order by total_amount desc;