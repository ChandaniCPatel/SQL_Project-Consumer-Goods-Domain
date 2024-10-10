# Get the Top 3 products in each division that have a high
# total_sold_quantity in the fiscal_year 2021?
select * from dim_product;

with cte1 as
(select 
p.division, s.product_code, p.product,
sum(s.sold_quantity) as total_sold_quantity
from dim_product p
join fact_sales_monthly s
on p.product_code=s.product_code
where s.fiscal_year = 2021
group by p.division, s.product_code, p.product),
cte2 as
(SELECT 
division, product_code, product, total_sold_quantity,
RANK() OVER(PARTITION BY division ORDER BY Total_sold_quantity DESC) AS 'rank_order' 
FROM cte1
)
select
cte1.division, cte1.product_code, cte1.product, 
cte1.total_sold_quantity, cte2.rank_order 
from cte1
join cte2
on cte1.product_code=cte2.product_code
where rank_order in (1,2,3)
;