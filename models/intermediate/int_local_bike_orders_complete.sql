WITH orders AS
(
    SELECT
        order_id,
        order_status,
        store_id,
        staff_id
    FROM {{ref ('stg_local_bike_orders')}}

)

,  stores AS 
(
    SELECT
        store_id,
        store_name,
        city,
        zip_code
    FROM {{ref ('stg_local_bike_stores')}}
)

, staffs AS
(
    SELECT
        staff_id,
        name,
        store_id,
        manager_id
    FROM {{ref ('stg_local_bike_staffs')}}
)

SELECT
    orders.order_id,
    orders.order_status,
    orders.store_id,
    stores.store_name,
    stores.city,
    stores.zip_code,
    staffs.staff_id,
    staffs.name,
    staffs.manager_id
FROM orders
LEFT JOIN stores ON orders.store_id = stores.store_id
LEFT JOIN staffs ON staffs.staff_id = orders.staff_id 