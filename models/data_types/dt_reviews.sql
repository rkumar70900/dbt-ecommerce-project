with nc_reviews as (
    select *
    from {{ ref('nc_reviews') }}
)

select
    reviewId,
    orderId,
    cast(rating as unsigned) as rating,
    reviewCommentTitle,
    reviewCommentMessage,
    STR_TO_DATE(reviewCreatedAt,'%Y-%m-%d %H:%i:%s') as reviewCreatedAt,
    STR_TO_DATE(reviewAnsweredAt,'%Y-%m-%d %H:%i:%s') as reviewAnsweredAt
from nc_reviews