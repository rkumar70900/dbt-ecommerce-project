with fake_reviews as (
    select *
    from {{ ref('fake_reviews') }}
)

select
    count(reviewId) as fakeReviewCount
from fake_reviews