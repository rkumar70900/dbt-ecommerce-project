"""
The query uses a Common Table Expression (CTE) called ch_monthly_orders to select data from the dt_orders table, which contains information about orders. 
The main query then groups the results by month and year using the month() and year() functions, respectively, and calculates the total count of unique orderIds for each month-year combination.
"""

with ch_monthly_orders as (
    select *
    from {{ ref('dt_orders') }}
)

select
    month(purchaseAt) as monthly,
    year(purchaseAt) as yearly,
    count(orderId) as totalOrders
from ch_monthly_orders
group by monthly, yearly
