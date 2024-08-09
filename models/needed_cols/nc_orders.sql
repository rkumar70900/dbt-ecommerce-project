with nc_orders as (
    select * from {{ ref('src_orders') }}
)

select
    order_id as orderId,
    customer_id as customerId,
    case 
    when order_status = 'canceled' then 'cancelled'
    else order_status 
    end as orderStatus,
    order_purchase_timestamp as purchaseAt,
    order_approved_at as approvedAt,
    order_delivered_carrier_date as carrierDelivery,
    order_delivered_customer_date as customerDelivery,
    order_estimated_delivery_date as estimatedDelivery
from nc_orders