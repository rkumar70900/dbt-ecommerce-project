with nc_reviews as (
    select *
    from {{ ref('src_reviews') }}
)

select
    review_id as reviewId,
    order_id as orderId,
    review_score as rating,
    review_comment_title as reviewCommentTitle,
    review_comment_message as reviewCommentMessage,
    review_creation_date as reviewCreatedAt,
    review_answer_timestamp as reviewAnsweredAt 
from nc_reviews