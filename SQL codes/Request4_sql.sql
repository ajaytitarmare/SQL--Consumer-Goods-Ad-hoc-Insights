#4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
#The final output contains these fields, segment product_count_2020 product_count_2021 difference


with unique_products_2020 as
(
	select p.segment, count(distinct f.product_code) as product_count_2020 
    from fact_sales_monthly f
    join dim_product p on f.product_code=p.product_code
    where fiscal_year=2020
    group by p.segment
),
unique_products_2021 as
(
	select  p.segment,count(distinct f.product_code) as product_count_2021 
    from fact_sales_monthly f
    join dim_product p on f.product_code=p.product_code
    where fiscal_year=2021
    group by p.segment
)

select c1.segment,c1.product_count_2020,c2.product_count_2021,
	(c2.product_count_2021-c1.product_count_2020) as difference  
    from unique_products_2020 c1
  join unique_products_2021 c2  on c1.segment=c2.segment

