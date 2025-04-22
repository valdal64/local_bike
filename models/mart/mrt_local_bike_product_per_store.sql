WITH product_comp AS
(
    SELECT 
        order_id,
        product_id,
        product_name,
        model_year,
        brand_name,
        quantity,
        turnover,
        reduction,
        discount
    FROM {{ref ('int_local_bike_products_complete')}}
)

, order_comp AS
(
    SELECT
        order_id,
        order_status,
        store_id,
        store_name,
        city,
        zip_code,
        name,
        manager_id
    FROM {{ref ('int_local_bike_orders_complete')}}
)

, stock AS
(
    SELECT 
    stock_qty
    FROM {{ref ('stg_local_bike_stock')}}
)

SELECT 
    prd.product_name,
    prd.model_year,
    prd.brand_name,
    st.order_status,
    st.store_name,
    st.city,
    st.zip_code,
    st.name,
    st.manager_id,
    COALESCE(SUM(prd.quantity),0) as qty,
    COALESCE(SUM(prd.turnover),0) as turnover,
    COALESCE(SUM(prd.reduction),0) as reduction,
    COALESCE(AVG(prd.discount),0) as avg_discount,
    COALESCE(stock.stock_qty,0) as stock_qty
FROM order_comp st
LEFT JOIN product_comp prd using(order_id)
LEFT JOIN stock using(store_id,product_id)
GROUP BY ALL