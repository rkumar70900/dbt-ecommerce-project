select *
from {{ ref('dt_orders') }}
where orderStatus = 'Delivered'
and customerDelivery > now()