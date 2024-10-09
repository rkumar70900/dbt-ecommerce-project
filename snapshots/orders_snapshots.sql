{% snapshot orders_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='orderId',
        strategy='check',
        check_cols=['orderStatus', 'customerDelivery']
    )
}}

select 
    orderId,
    customerId,
    orderStatus,
    purchaseAt,
    approvedAt,
    carrierDelivery,
    customerDelivery,
    estimatedDelivery
from {{ ref('dt_orders')}}

{% endsnapshot %}