#5. Get the products that have the highest and lowest manufacturing costs. 
#The final output should contain these fields, product_code product manufacturing_cost




select p.product_code,p.product, mc.manufacturing_cost
from dim_product p 
join fact_manufacturing_cost mc
on p.product_code=mc.product_code
where mc.manufacturing_cost in
(

	select MAX(manufacturing_cost) as min_cost from fact_manufacturing_cost
	union
    select MIN(manufacturing_cost) as max_cost from fact_manufacturing_cost
    
 )   
 order by mc.manufacturing_cost desc;
 
 #_____________________________________________________________________
 
 (select p.product_code,p.product,MAX(manufacturing_cost) as manufacturing_cost 
 from dim_product p 
 join fact_manufacturing_cost mc on p.product_code=mc.product_code
 group by p.product_code,p.product
 order by  manufacturing_cost desc 
limit 1)
 UNION 
(select p.product_code,p.product,MIN(manufacturing_cost) as manufacturing_cost 
 from dim_product p 
 join fact_manufacturing_cost mc on p.product_code=mc.product_code
 group by p.product_code,p.product
 order by  manufacturing_cost asc
limit 1)

 