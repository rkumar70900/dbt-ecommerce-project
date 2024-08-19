with order_total as (
select orderId, sum(price) as total_price
from {{ ref('dt_orderitems') }}
group by orderId    
),

payment_total as (
    select orderId, sum(paymentValue) as total_payment
    from {{ ref('dt_payments') }}
    group by orderId

)

select a.orderId
from order_total a join payment_total b on a.orderId = b.orderId
where a.total_price <> b.total_payment