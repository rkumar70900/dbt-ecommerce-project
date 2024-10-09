"""
The query uses two Common Table Expressions (CTEs) called orders and reviews to select data from the dt_orders and dt_reviews tables, respectively. The main query then joins these two CTEs on the orderId column, filtering out rows where the review creation date is not after the customer delivery date, and the order status is not 'Delivered'. Finally, it calculates the average difference between the review creation date and the customer delivery date, effectively measuring the average time it takes for customers to respond with a review.
"""
with orders as (
    select *
    from {{ ref('dt_orders') }}
),

reviews as (
    select *
    from {{ ref('dt_reviews') }}
)

select
    avg(datediff(reviews.reviewDate, orders.customerDelivery)) as averageResponseTime
from orders join reviews on orders.orderId = reviews.orderId
where reviews.reviewDate > orders.customerDelivery
and orders.orderStatus = 'Delivered'