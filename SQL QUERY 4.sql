# Which segment had the most increase in unique products in
# 2021 vs 2020?

with cte1 as
(select p.segment as A, count(distinct(s.product_code)) as B
 from fact_sales_monthly s
 join dim_product p
 on p.product_code=s.product_code
 where s.fiscal_year=2020
 group by p.segment),
cte2 as
(select p.segment as C, count(distinct(s.product_code)) as D
 from fact_sales_monthly s
 join dim_product p
 on p.product_code=s.product_code
 where s.fiscal_year=2021
 group by p.segment)
 
SELECT 
CTE1.A AS segment, 
CTE1.B AS product_count_2020, 
CTE2.D AS product_count_2021, 
(CTE2.D-CTE1.B) AS difference  
FROM CTE1, CTE2
WHERE CTE1.A = CTE2.C 
order by difference desc
limit 1;