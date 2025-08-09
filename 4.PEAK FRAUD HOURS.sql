--PEAK FRAUD HOURS (STEP=HOUR)
select step, count(*) as fraud_count
from ps
where isFraud = 1
group by step
order by fraud_count  desc;