SELECT
    order_id,
    sum(total_order_item_amount) as total_amount
FROM {{ ref('stg_localbike_dataset__order_items') }}
GROUP BY order_id
HAVING total_amount < 0