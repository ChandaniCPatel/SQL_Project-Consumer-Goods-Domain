# In which quarter of 2020, got the maximum total_sold_quantity?

with cte1 as
(select *,  
CASE 
    WHEN MONTH(date) IN (9,10,11) THEN "Q1"
    WHEN MONTH(date) IN (12, 1, 2) THEN "Q2"
    WHEN MONTH(date) IN (3,4,5) THEN "Q3"
    WHEN MONTH(date) IN (6,7,8) THEN "Q4"
  END AS financial_quarter
from fact_Sales_monthly)
select cte1.financial_quarter, sum(sold_quantity) as total_sold_quantity 
from cte1
where cte1.fiscal_year=2020
group by cte1.financial_quarter
order by total_sold_quantity desc
limit 1
;