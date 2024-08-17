with nc_payments as (
    select *
    from {{ ref('nc_payments') }}
)

select 
    orderId,
    paymentType,
    noInstallments,
    cast(paymentValue as float) as paymentValue
from nc_payments