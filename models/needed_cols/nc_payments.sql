with nc_payments as (
    select *
    from {{ ref('src_payments') }}
)

select
    order_id as orderId,
    payment_type as paymentType,
    payment_installments as noInstallments,
    payment_value as paymentValue
from nc_payments