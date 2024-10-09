with reviews as (
    select *
    from {{ ref('dt_reviews') }}
),

orders as (
    select *
    from {{ ref('dt_orders') }}
)

select reviews.reviewId as reviewId, orders.orderId as orderId
from orders join reviews on orders.orderId = reviews.orderId
where reviews.reviewCreatedAt < orders.customerDelivery
and orders.orderStatus = 'delivered'