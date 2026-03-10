CREATE DEFINER=`root`@`localhost` PROCEDURE `get_monthly_gross_sales_for_customer`(
	in_customer_codes text
    
)
BEGIN
	select f.date, sum(round(g.gross_price*f.sold_quantity,2)) as total_gross_price_monthly
	from fact_sales_monthly f
	join fact_gross_price g
	on g.product_code = f.product_code and
	   g.fiscal_year = get_fiscal_year(f.date)
	where find_in_set(f.customer_code, in_customer_codes)>0
	group by date;
END