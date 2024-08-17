select *
from {{ ref('dt_orders') }}
where purchaseAt > now()