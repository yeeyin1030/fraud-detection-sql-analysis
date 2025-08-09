--FRAUD RATE BY TYPE
select type, count(*) as total_transaction,
sum(isFraud) as fraud_count,
round(100.0* sum(isFraud) / count(*),2) as fraud_rate
from ps
group by type
order by fraud_rate desc;