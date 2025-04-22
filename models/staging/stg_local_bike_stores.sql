SELECT 
    store_id,
    store_name,
    city,
    zip_code
FROM {{ source ('local_bike', 'stores')}}