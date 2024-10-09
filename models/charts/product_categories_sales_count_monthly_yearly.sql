"""
The query uses three Common Table Expressions (CTEs) called orders, products, and orderItems to select data from the dt_orders, dt_products, and nc_orderitems tables, respectively. 
The main query then joins these CTEs based on order ID and product ID, and groups the results by product category, month, and year. Finally, it calculates the total count of orders for each group.
"""

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
    