with ch_customer_delivery_status_count as (
    select *
    from {{ ref('rc_customer_delivery_status') }}
)

select
    deliveryTime,
    count(*) as countDeliveryTime
from ch_customer_delivery_status_count
group by deliveryTime
