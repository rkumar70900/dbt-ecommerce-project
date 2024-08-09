select
    orders.orderId
from {{ ref('dt_orders') }} as orders join {{ ref('dt_reviews') }} as reviews
on orders.orderId = reviews.orderId
where orders.approvedAt > reviews.reviewDate
