SELECT
--from raw orders
     O.ORDER_ID        ,
    O.ORDER_DATE      ,
    O.SHIP_DATE       ,
    O.SHIP_MODE       ,
    O.CUSTOMER_ID     ,
    0.PRODUCT_ID      ,
    0.ORDE_COST_PRICE ,
    O.ORDER_SELLING_PRICE,
--from raw customer  
    C.CUSTOMERID    , 
    C.CUSTOMERNAME   ,
    C.SEGMENT         ,
    C.COUNTRY         ,
    C.STATE           ,
   
--from raw product
    P.ProductID  ,
    P.ProductName ,
    P.CATEGORY    ,
    P.SubCategory ,
(O.ORDER_SELLING_PRICE-O.ORDE_COST_PRICE) AS ORDER_PROFIT
 FROM {{ ref('RAW_ORDER') }} AS O
 LEFT JOIN 
        {{ ref('RAW_CUSTOMER') }} AS C
ON
    C.CUSTOMERID=O.CUSTOMER_ID
LEFT JOIN
    {{ ref('RAW_PRODUCT') }} AS P
ON
    P.PRODUCTID=O.PRODUCT_ID