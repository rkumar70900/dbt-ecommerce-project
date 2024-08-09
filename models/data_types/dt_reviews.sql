with nc_reviews as (
    select *
    from {{ ref('nc_reviews') }}
)

select
    reviewId,
    orderId,
    cast(rating as unsigned) as rating,
    convert(reviewDate, date) as reviewDate
from nc_reviews