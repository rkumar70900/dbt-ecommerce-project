with nc_orderitems as (
    select *
    from {{ ref('src_orderitems') }}
)

select
    order_id as orderId,
    product_id as productId,
    seller_id as sellerId,
    shipping_limit_date as sellerLogisticDeliveryDate
from nc_orderitems