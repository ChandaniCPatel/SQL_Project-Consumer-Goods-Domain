# What is the percentage of unique product increase in 2021 vs. 2020?
SELECT x.a AS unique_product_2020, y.b AS unique_products_2021, ROUND((B-A)*100/A, 2) AS percentage_chg
FROM (
      (SELECT COUNT(DISTINCT(product_code)) AS a FROM fact_sales_monthly
      WHERE fiscal_year = 2020) x,
      (SELECT COUNT(DISTINCT(product_code)) AS b FROM fact_sales_monthly
      WHERE fiscal_year = 2021) y
	 )