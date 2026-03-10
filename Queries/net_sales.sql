SELECT * FROM net_sales


## TOP 5 MARKETS IN FY21

SELECT market,
	round(sum(net_sales)/1000000,2) as net_sales_mln
FROM gdb0041.net_sales
where fiscal_year = 2021
group by market
order by net_sales_mln desc
limit 5;

## TOP 5 CUSTOMERS IN FY21

SELECT c.customer,
	round(sum(net_sales)/1000000,2) as net_sales_mln
FROM gdb0041.net_sales n
join dim_customer c 
on c.customer_code = n.customer_code
where fiscal_year = 2021
group by c.customer
order by net_sales_mln desc
limit 5;

## TOP 5 PRODUCTS IN FY21

SELECT product,
	round(sum(net_sales)/1000000,2) as net_sales_mln
FROM gdb0041.net_sales
where fiscal_year = 2021
group by product
order by net_sales_mln desc
limit 5;

