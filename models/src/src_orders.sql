with raw_orders as (
    select *
    from {{ source('ecommerce_database', 'orders') }}
)

select *
from raw_orders