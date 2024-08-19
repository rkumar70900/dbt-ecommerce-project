with nc_orderitems as (
    select *
    from {{ source('ecommerce_database', 'order_items') }}
)

select
    order_id as orderId,
    product_id as productId,
    seller_id as sellerId,
    shipping_limit_date as sellerLogisticDeliveryDate,
    price as price
from nc_orderitems