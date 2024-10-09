"""
The query uses a Common Table Expression (CTE) called RankedCategories to rank product categories by their total orders per month and year, in descending order (i.e., from highest to lowest). The ranking is done using the ROW_NUMBER() function, which assigns a unique number to each row within each group defined by the PARTITION BY clause.

The main query then selects the top-ranked category for each month-year combination (i.e., the one with the highest total orders) by filtering the results where rn = 1. The resulting data is ordered by year and month.
"""
WITH RankedCategories AS (
    SELECT
        monthly,
        yearly,
        productCategory,
        totalOrders,
        ROW_NUMBER() OVER (PARTITION BY monthly, yearly ORDER BY totalOrders DESC) AS rn
    FROM product_categories_sales_count_monthly_yearly
)
SELECT
    monthly,
    yearly,
    productCategory
FROM RankedCategories
WHERE rn = 1
order by yearly, monthly