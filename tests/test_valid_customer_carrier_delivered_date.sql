select *
from {{ ref('dt_orders') }}
where customerDelivery < carrierDelivery