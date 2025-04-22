SELECT 
    product_name,
    brand_name,
    model_year,
    list_price,
    COUNT(DISTINCT order_id) as nb_order_per_product,
    SUM(quantity) AS product_qty,
    SUM(turnover) AS product_turnover,
    SUM(reduction) AS product_reduction,
    AVG(discount) AS avg_product_discount
FROM {{ref ('int_local_bike_products_complete')}}
GROUP BY ALL