with orders as (
    select * 
    from {{ ref('dt_orders') }}
),

products as (
    select *
    from {{ ref('dt_products') }}
),

orderItems as (
    select *
    from {{ ref('nc_orderitems') }}
)

select
    month(orders.purchaseAt) as monthly,
    products.productCategory as productCategory,
    year(orders.purchaseAt) as yearly,
    count(*) as totalOrders
from orders join orderItems on orders.orderId = orderItems.orderId
join products on products.productId = orderItems.productId
group by productCategory, monthly, yearly
    