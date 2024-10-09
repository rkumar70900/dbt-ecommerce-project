"""
The query uses two Common Table Expressions (CTEs) called orders and reviews to select data from the dt_orders and dt_reviews tables, respectively. 
The main query then joins these two CTEs on the orderId column, filtering out rows where the review creation date is not after the customer delivery date, and the order status is not 'Delivered'. 
Finally, it calculates the average difference between the review creation date and the customer delivery date, effectively measuring the average time it takes for customers to respond with a review.
"""

with ch_product_category_count as (
    select *
    from {{ ref('dt_products') }}
)

select
    productCategory,
    count(productId) as categoryCount
from ch_product_category_count
group by productCategory