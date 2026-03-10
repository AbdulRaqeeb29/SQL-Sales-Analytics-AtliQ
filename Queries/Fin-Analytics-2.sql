# generate Monthly gross sales report for Croma India customer

select f.date, sum(round(g.gross_price*f.sold_quantity,2)) as gross_price_total

from fact_sales_monthly f
join fact_gross_price g
on g.product_code = f.product_code and
g.fiscal_year = get_fiscal_year(f.date)
where customer_code = 90002002
group by f.date
order by f.date

# generate Yearly gross sales report for Croma India customer

select get_fiscal_year(f.date) as FY, sum(round(g.gross_price*f.sold_quantity,2)) as total_gross_price_yearly

from fact_sales_monthly f
join fact_gross_price g
on g.product_code = f.product_code and
g.fiscal_year = get_fiscal_year(f.date)
where customer_code = 90002002
group by get_fiscal_year(date)
order by FY
