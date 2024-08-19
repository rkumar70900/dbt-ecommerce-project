with dt_orders as (
    select *
    from {{ref('nc_orders')}}
)

select
    orderId,
    customerId,
    orderStatus,
    STR_TO_DATE(purchaseAt,'%Y-%m-%d %H:%i:%s') as purchaseAt,
    STR_TO_DATE(approvedAt,'%Y-%m-%d %H:%i:%s') as approvedAt,
    STR_TO_DATE(carrierDelivery,'%Y-%m-%d %H:%i:%s') as carrierDelivery,
    STR_TO_DATE(customerDelivery,'%Y-%m-%d %H:%i:%s') as customerDelivery,
    STR_TO_DATE(estimatedDelivery,'%Y-%m-%d %H:%i:%s') as estimatedDelivery
from dt_orders