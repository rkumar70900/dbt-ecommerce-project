with rc_customer_early_delivery_days as (
    select *
    from {{ ref('rc_customer_delivery_status') }}
)

select
    avg(datediff(estimatedDelivery,customerDelivery)) as averageEarlyDeliveryDays,
    max(datediff(estimatedDelivery,customerDelivery)) as maximumEarlyDeliveryDays,
    min(datediff(estimatedDelivery,customerDelivery)) as minimumEarlyDeliveryDays
from rc_customer_early_delivery_days
where deliveryTime = 'early'