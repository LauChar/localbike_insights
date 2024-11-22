SELECT
    oi.order_id,
    oi.order_item_id, 
    oi.total_order_item_amount,
    oi.product_quantity,
    oi.product_id,
    o.customer_id,
    o.store_id
FROM
    {{ ref('stg_localbike_dataset__order_items') }} AS oi
INNER JOIN
    {{ ref('stg_localbike_dataset__orders') }} AS o
ON oi.order_id = o.order_id