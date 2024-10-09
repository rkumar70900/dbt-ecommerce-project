with orders as (
    select *
    from {{ ref('dt_orders') }}
),

reviews as (
    select *
    from {{ ref('dt_reviews') }}
)

select
    avg(datediff(reviews.reviewCreatedAt, orders.customerDelivery)) as averageResponseTime
from orders join reviews on orders.orderId = reviews.orderId
where reviews.reviewCreatedAt > orders.customerDelivery
and orders.orderStatus = 'Delivered'