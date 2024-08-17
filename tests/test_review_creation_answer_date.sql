select *
from {{ ref('dt_reviews') }}
where reviewCreatedAt >= reviewAnsweredAt