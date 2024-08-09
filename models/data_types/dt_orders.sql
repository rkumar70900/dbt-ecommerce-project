with dt_orders as (
    select *
    from {{ref('nc_orders')}}
)

select
    orderId,
    customerId,
    convert(orderStatus, char) as orderStatus,
    convert(purchaseAt, date) as purchaseAt,
    convert(approvedAt, date) as approvedAt,
    convert(carrierDelivery, date) as carrierDelivery,
    convert(customerDelivery, date) as customerDelivery,
    convert(estimatedDelivery, date) as estimatedDelivery
from dt_orders