SELECT pre.customer_code,
C.customer as customer,
pre.pre_invoice_discount_pct  as average_discount_percentage
FROM gdb023.fact_pre_invoice_deductions pre
join dim_Customer C 
on pre.customer_code=c.customer_code
where pre.fiscal_year=2021 and
c.market = "india"
order by pre_invoice_discount_pct desc
limit 5;