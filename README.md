# Fraud Detection SQL Analysis

##  Overview
This project performs exploratory data analysis on the **Synthetic Financial Dataset for Fraud Detection** using SQL.  
The goal is to uncover insights about fraudulent transactions, identify high-risk transaction types, and analyze patterns in transaction amounts and time.

##  Dataset
- **Source:** [Synthetic Financial Dataset for Fraud Detection on Kaggle](https://www.kaggle.com/datasets/ealaxi/paysim1)
- **Description:**  
  Contains simulated financial transactions with the following key columns:
  - `step` – time step in hours from the start of the simulation
  - `type` – transaction type (e.g., CASH_IN, CASH_OUT, TRANSFER)
  - `amount` – transaction amount
  - `isFraud` – 1 if the transaction is fraudulent, 0 otherwise
  - `isFlaggedFraud` – 1 if transaction was flagged by system

## 🛠 Tools Used
- **Database:** SQLite (via DBeaver)
- **Language:** SQL
- **Version Control:** Git & GitHub

## 📊 SQL Queries & Insights
1. **Total Transactions by Type**  
   Counts number of transactions and total transaction amount per type.

2. **Fraud Rate by Transaction Type**  
   Calculates percentage of fraudulent transactions for each transaction type.

3. **Most Common Fraudulent Amounts**  
   Identifies transaction amounts that appear most often in fraud cases.

4. **Fraud Distribution by Time Step**  
   Shows which time steps (hours) have the highest number of fraudulent transactions.

5. **Top 5 Largest Fraudulent Transactions**  
   Lists the five biggest fraud transactions by amount.


Key Findings
TRANSFER and CASH_OUT have the highest fraud rates.

Certain transaction amounts occur repeatedly in fraud cases.

##Example Query

--TOTAL NUMBER OF TRANSACTIONS BY TYPE
select type, count(*) as total_transactions,
round(sum(amount),2) as total_amount 
from ps
group by type
order by total_amount desc;

--FRAUD RATE BY TYPE
select type, count(*) as total_transaction,
sum(isFraud) as fraud_count,
round(100.0* sum(isFraud) / count(*),2) as fraud_rate
from ps
group by type
order by fraud_rate desc;

--MOST COMMON FRAUD AMOUNTS
select amount, count(*) as total_amount
from ps
where isFraud = 1
group by amount 
order by total_amount desc
limit 10;

--PEAK FRAUD HOURS (STEP=HOUR)
select step, count(*) as fraud_count
from ps
where isFraud = 1
group by step
order by fraud_count  desc;

--TOP 5 HIGHEST TRANSACTIONS THAT ARE FRAUD
select *
from ps
where isFraud  =1
order by amount desc 
limit 5;



