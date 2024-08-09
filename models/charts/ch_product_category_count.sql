with ch_product_category_count as (
    select *
    from {{ ref('dt_products') }}
)

select
    productCategory,
    count(productId) as categoryCount
from ch_product_category_count
group by productCategory