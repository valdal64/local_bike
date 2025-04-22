SELECT 
    order_id,
    order_status,
    store_id,
    staff_id
FROM {{ source ('local_bike', 'orders')}}