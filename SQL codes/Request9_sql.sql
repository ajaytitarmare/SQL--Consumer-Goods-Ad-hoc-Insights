#9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? 
#The final output contains these fields, channel gross_sales_mln percentage

	with cte1 as
	(
		select c.channel, ROUND(sum(fm.sold_quantity*fg.gross_price)/1000000,2) as gross_sales_mln
		from fact_sales_monthly fm
		join fact_gross_price fg on fm.product_code=fg.product_code
		join dim_customer c on c.customer_code=fm.customer_code
		where fm.fiscal_year=2021
		group by c.channel
	)

	select channel,gross_sales_mln, ROUND(gross_sales_mln*100/sum(gross_sales_mln) over() ,2)		 as percentage  from cte1