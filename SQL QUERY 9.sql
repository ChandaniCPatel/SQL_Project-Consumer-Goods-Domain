# Which channel helped to bring more gross sales in the fiscal year 2021
# and the percentage of contribution?
select * from dim_customer;
select * from fact_Sales_monthly;

with cte1 as
(select 
c.channel, 
concat(round(sum(s.sold_quantity*gp.gross_price)/1000000,2), " M") as gross_sales_mln
 from fact_sales_monthly s
join fact_gross_price GP
on s.product_code=gp.product_code
join dim_customer c
on s.customer_code=c.customer_code
where s.fiscal_year = 2021
group by c.channel)
select *,
concat(round(cte1.gross_sales_mln*100/sum(cte1.gross_sales_mln) over(),2)," %") 
as percentage 
from cte1
order by percentage desc
;
