select productId
from {{ ref('nc_products') }} a
inner join {{ ref('product_category_name_translation') }} b on a.productCategory = b.product_category_name
where b.product_category_name is null