#6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct 
#for the fiscal year 2021 and in the Indian market. 
#The final output contains these fields, customer_code customer average_discount_percentage


	with cte1 as
	(
	select customer_code,ROUND(	avg(pre_invoice_discount_pct)*100,2)  as average_discount_percentage
	from fact_pre_invoice_deductions
	where fiscal_year=2021
	group by  customer_code
	)

	select c.customer_code,c.customer, pre.average_discount_percentage 
	from dim_customer c
	join cte1 pre on c.customer_code=pre.customer_code
	where c.market="India"
	order by pre.average_discount_percentage desc
	limit 5
