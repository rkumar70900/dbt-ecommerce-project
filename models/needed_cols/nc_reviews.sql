with nc_reviews as (
    select *
    from {{ ref('src_reviews') }}
)

select
    review_id as reviewId,
    order_id as orderId,
    review_score as rating,
    review_answer_timestamp as reviewDate
from nc_reviews