WITH RankedCategories AS (
    SELECT
        monthly,
        yearly,
        productCategory,
        totalOrders,
        ROW_NUMBER() OVER (PARTITION BY monthly, yearly ORDER BY totalOrders) AS rn
    FROM {{ ref('product_categories_sales_count_monthly_yearly') }}
)
SELECT
    monthly,
    yearly,
    productCategory
FROM RankedCategories
WHERE rn = 1
order by yearly, monthly