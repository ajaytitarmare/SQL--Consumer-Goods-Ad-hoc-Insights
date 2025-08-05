#2. What is the percentage of unique product increase in 2021 vs. 2020? 
#The final output contains these fields
#unique_products_2020 unique_products_2021 percentage_chg


with unique_products_2020 as
(
	select count(distinct product_code) as unique_products_2020 
    from fact_sales_monthly 
    where fiscal_year=2020
),
unique_products_2021 as
(
	select count(distinct product_code) as unique_products_2021 
    from fact_sales_monthly 
    where fiscal_year=2021
)

select *,
	ROUND((unique_products_2021-unique_products_2020)/unique_products_2020*100,2) as percentage_chg  
    from unique_products_2020 c1
cross join unique_products_2021 c2
