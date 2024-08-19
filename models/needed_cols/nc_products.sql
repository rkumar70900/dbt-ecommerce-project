with nc_products as (
    select *
    from {{ source('ecommerce_database', 'products') }}
)

select
    product_id as productId,
    replace(product_category_name, '_', ' ') as productCategory
from nc_products