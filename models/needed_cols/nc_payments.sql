with nc_payments as (
    select *
    from {{ source('ecommerce_database', 'payments') }}
)

select
    order_id as orderId,
    payment_type as paymentType,
    payment_installments as noInstallments,
    payment_value as paymentValue
from nc_payments