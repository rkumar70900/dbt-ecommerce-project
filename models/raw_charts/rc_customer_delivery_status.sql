with rc_customer_delivery_status as (
    select *
    from {{ ref('dt_orders') }}
)


select 
    orderID,
    estimatedDelivery,
    customerDelivery,
    case when datediff(estimatedDelivery,customerDelivery) < 0 then 'late'
    when datediff(estimatedDelivery,customerDelivery) > 0 then 'early'
    else 'ontime'
    end as deliveryTime
from rc_customer_delivery_status
where orderStatus = 'delivered'
and customerDelivery is NOT NULL
and estimatedDelivery is NOT NULL
