SELECT
    concat(order_id, '_', item_id) as order_item_id,
    order_id,
    item_id,
    product_id,
    quantity as product_quantity,
    list_price as product_price,
    discount,
    (list_price * quantity * (1-discount)) as total_order_item_amount
FROM {{ source('localbike_dataset', 'order_items') }}