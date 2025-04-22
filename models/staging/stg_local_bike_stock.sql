SELECT 
    store_id,
    product_id,
    quantity as stock_qty
FROM {{ source ('local_bike', 'stocks')}}