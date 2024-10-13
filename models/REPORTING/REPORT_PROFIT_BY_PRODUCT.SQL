SELECT 
    ProductID,
    ProductName,
    CATEGORY,
    SubCategory,
    SUM(ORDER_PROFIT) AS PROFIT
FROM {{ ref('STG_ORDERS') }}
GROUP BY
 ProductID,
    ProductName,
    CATEGORY,
    SubCategory