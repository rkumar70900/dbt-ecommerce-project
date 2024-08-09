with raw_order_items as (
    select *
    from ecommerce_database.order_items
)

select *
from raw_order_items