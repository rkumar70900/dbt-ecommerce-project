with dt_products as (
    select *
    from {{ ref('nc_products') }}
)

select
    b.product_category_name_english as productCategory,
    a.productId as productId
from dt_products as a join {{ ref('product_category_name_translation') }} as b
on a.productCategory = b.product_category_name