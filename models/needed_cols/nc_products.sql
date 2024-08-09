with nc_products as (
    select *
    from {{ ref('src_products') }}
)

select
    product_id as productId,
    replace(product_category_name, '_', ' ') as productCategory
from nc_products