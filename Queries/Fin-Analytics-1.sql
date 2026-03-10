-- month
-- product name & variant
-- sold quantity
-- gross price per item
-- gross price total


# now inserting fiscal year.
# atliq fy starts from sep - aug, so we can add 4 months to date to extract fiscal year.

select * from fact_sales_monthly
where customer_code=90002002
and get_fiscal_year(date)=2021
and get_fiscal_month(date)="Q4"
order by date;

# getting product and variant
# also get gross price from fact_gross_price
# then get total_gross_price

select f.date, f.product_code, p.product, p.variant, 
	f.sold_quantity, round(g.gross_price,2) as gross_price, round(f.sold_quantity*g.gross_price,2) as gross_price_total
from fact_sales_monthly f
join dim_product p
on p.product_code = f.product_code
join fact_gross_price g
on g.product_code = f.product_code and 
   g.fiscal_year = get_fiscal_year(f.date)
where
	customer_code=90002002 and
    get_fiscal_year(date)=2021
order by date    


