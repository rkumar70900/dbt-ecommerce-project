
with nc_customers as (
    select * 
    from {{ source('ecommerce_database', 'customers') }}
)

select
    customer_id as customerId,
    customer_zip_code_prefix as customerZipcode,
    customer_city as customerCity,
    customer_state as customerStatePrefix
from nc_customers