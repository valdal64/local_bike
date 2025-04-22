SELECT
    staff_id,
    CONCAT(first_name, ' ', last_name) as name,
    active,
    store_id,
    manager_id
FROM {{ source('local_bike', 'staffs')}} 