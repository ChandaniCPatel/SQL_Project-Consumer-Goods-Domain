# Get the complete report of the Gross sales amount for the customer “Atliq
# Exclusive” for each month. This analysis helps to get an idea of low and
# high-performing months and take strategic decisions.

select 
monthname(s.date) as Month, 
year(s.date) as Year, 
round(sum(gross_price*sold_quantity),2) as gross_sales_amount 
from fact_sales_monthly s
join fact_gross_price g
on  s.product_code=g.product_code
join dim_customer c
on s.customer_code=c.customer_code
where c.customer="Atliq Exclusive"
group by month, year
order by year