"""
The query uses a subquery called orders to select data from the dt_orders table, which contains information about orders. The main query then calculates the average difference between the carrier delivery date and the approved date for each order, effectively measuring the average delivery time for each shipper.
"""


with orders as (
    select
        *
    from
        dt_orders
),
select
    avg(datediff(carrierDelivery, approvedAt)) as averageShipperDelivery
from
    orders
