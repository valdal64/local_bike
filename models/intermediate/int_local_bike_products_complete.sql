WITH brand AS
(
    SELECT
        brand_id,
        brand_name
    FROM {{ref ('stg_local_bike_brands')}}
)

, product AS
(
    SELECT
        product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        list_price
    FROM {{ref ('stg_local_bike_products')}}
)

, order_items AS
(
    SELECT
        order_id,
        product_id,
        quantity,
        turnover,
        reduction,
        list_price,
        discount,
    FROM {{ref ('stg_local_bike_order_items')}}
)

SELECT
    prod.product_name,
    prod.model_year,
    prod.brand_id,
    brand.brand_name,
    item.order_id,
    item.quantity,
    item.turnover,
    item.reduction,
    item.list_price,
    item.discount,
    item.product_id

FROM order_items item 
LEFT JOIN product prod ON item.product_id = prod.product_id
LEFT JOIN brand ON brand.brand_id = prod.brand_id
