with fake_reviews as (
    select *
    from {{ ref('fake_reviews') }}
),

orderitems as (
    select *
    from {{ ref('nc_orderitems') }}
),

products as (
    select *
    from {{ ref('dt_products') }}
)

select
    products.productCategory as productCategory,
    count(fake_reviews.reviewId) as fakeCountCategory
from fake_reviews join orderitems on fake_reviews.orderId = orderitems.orderId
join products on orderitems.productId = products.productId
group by productCategory