select *
from {{ ref('dt_reviews') }}
where reviewCommentTitle is not null
and reviewCommentMessage is null