SELECT 
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount,
    ROUND(quantity * list_price,2) AS turnover,
    ROUND(list_price * discount,2) AS reduction
FROM {{ source ('local_bike', 'order_items')}}