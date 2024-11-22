WITH orders_summary AS (
SELECT
    customer_id,
    customer_state,
    SUM(total_order_amount) AS total_amount_spent,
    SUM(total_items) as total_items,
    SUM(total_distinct_items) as total_distinct_items,
    COUNT(DISTINCT order_id) AS total_orders
FROM {{ ref('int_localbike_dataset__orders') }}
GROUP BY
 customer_id,
 customer_state
)

SELECT
    o.customer_id,
    o.customer_state,
    os.total_amount_spent,
    os.total_items,
    os.total_distinct_items,
    os.total_orders,
    p.favorite_product_id
FROM
    orders_summary AS o
INNER JOIN
    orders_summary os
    ON os.customer_id = o.customer_id
LEFT JOIN
    {{ ref('int_localbike_dataset__customer_favorite_product') }} p
    ON o.customer_id = p.customer_id