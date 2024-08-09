with nc_sellers as (
    select *
    from {{ ref('src_sellers') }}
)

select
    seller_id as sellerId,
    seller_zip_code_prefix as sellerZipcode,
    seller_city as sellerCity,
    seller_state as sellerStatePrefix
from nc_sellers