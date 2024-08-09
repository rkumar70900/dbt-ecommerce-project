with nc_payments as (
    select *
    from {{ ref('src_payments') }}
)

select
    order_id as orderId,
    payment_type as paymentType,
    payment_installments as noInstallments
from nc_payments