## pulling the pre-invoice discounts
## created view sales_pre_inv_disc
## fetched net_invoice_sales


select *, (1 - pre_invoice_discount_pct)*gross_price_total as net_invoice_sales,
	(post.discounts_pct + post.other_deductions_pct) as post_invoice_discount_pct
from sales_pre_inv_disc s
join fact_post_invoice_deductions as post
on s.date = post.date and
	s.product_code = post.product_code and
    s.customer_code = post.customer_code

