#7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month . 
#This analysis helps to get an idea of low and high-performing months and take strategic decisions. 
#The final report contains these columns: Month Year Gross sales Amount

select month(date_add(fm.date, INTERVAL 4 MONTH)) as Month,fm.fiscal_year as Year , round(SUM(fm.sold_quantity*fp.gross_price),2) as Gross_sales_Amount
from fact_sales_monthly fm
join fact_gross_price  fp on fm.product_code=fp.product_code
join dim_customer c on fm.customer_code=c.customer_code
where c.customer="Atliq Exclusive"
group by fm.date,fm.fiscal_year
order by month
