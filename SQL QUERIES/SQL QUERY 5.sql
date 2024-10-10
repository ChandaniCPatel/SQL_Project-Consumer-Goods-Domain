# Get the products that have the highest and lowest manufacturing costs.
select 
m.product_code as product_code, 
p.product as product, 
m.manufacturing_cost as manufacturing_cost
from fact_manufacturing_cost M
join dim_product P
on p.product_code=m.product_code
where manufacturing_cost in
((select max(manufacturing_cost) from fact_manufacturing_cost),
(select min(manufacturing_cost) from fact_manufacturing_cost));