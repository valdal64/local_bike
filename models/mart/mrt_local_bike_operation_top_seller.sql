SELECT 
    stf.name,
    sold.store_name,
    stf.manager_id,
    stf.store_id,
    sold.city,
    sold.zip_code,
    sold.order_status,
    COUNT(DISTINCT sold.order_id) AS nb_order_in_charge
FROM {{ref ('stg_local_bike_staffs')}} stf
LEFT JOIN {{ ref('int_local_bike_orders_complete')}} sold ON stf.name = sold.name
GROUP BY ALL