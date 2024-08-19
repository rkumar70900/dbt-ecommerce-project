with dt_ordersitems as (
    select *
    from {{ ref('nc_orderitems') }}
)

select 
    orderId,
    productId,
    sellerId,
    STR_TO_DATE(sellerLogisticDeliveryDate,'%Y-%m-%d %H:%i:%s') as sellerLogisticDeliveryDate,
    cast(price as float) as price
from dt_ordersitems