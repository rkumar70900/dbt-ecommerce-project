with orders as (
    select *
    from {{ ref('dt_orders') }}
)

select
    avg(datediff(carrierDelivery, approvedAt)) as averageShipperDelivery
from orders