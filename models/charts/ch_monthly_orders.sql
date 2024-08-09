with ch_monthly_orders as (
    select * 
    from {{ ref('dt_orders') }}
)

select
    month(purchaseAt) as monthly,
    year(purchaseAt) as yearly,
    count(orderId) as totalOrders
from ch_monthly_orders
group by monthly, yearly
