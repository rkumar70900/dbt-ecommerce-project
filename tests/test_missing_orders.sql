select a.orderId
from {{ ref('dt_orders') }} a
inner join {{ ref('dt_orderitems') }} b on a.orderId = b.orderId
where a.orderStatus = 'delivered'
and b.orderId is null