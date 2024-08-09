with prod_cat_sales as (
    select *
    from {{ ref('product_categories_sales_count_monthly_yearly')}}
)

select
    monthly,
    productCategory,
    totalOrders
from prod_cat_sales
where yearly = '2017'
