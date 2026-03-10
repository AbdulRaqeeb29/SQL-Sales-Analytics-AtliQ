select * from net_sales

with cte1 AS
(	SELECT c.customer,
		ROUND(SUM(net_sales)/1000000,2) AS net_sales_mln
	FROM net_sales n
	JOIN dim_customer c 
	ON n.customer_code = c.customer_code
	WHERE n.fiscal_year = 2021
	GROUP BY c.customer
)
	
select *, net_sales_mln * 100 / SUM(net_sales_mln) over() as market_share_pct
from cte1;


     

