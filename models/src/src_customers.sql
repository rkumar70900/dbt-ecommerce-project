with raw_customers as (
    select *
    from {{ source('ecommerce_database', 'customers') }}
)

select *
from raw_customers


