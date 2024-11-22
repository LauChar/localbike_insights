WITH order_items_grouped_by_order AS (
  SELECT
    order_id,
    sum(total_order_item_amount) as total_order_amount,
    sum(product_quantity) as total_items,
    count(distinct product_id) as total_distinct_items
  FROM {{ ref('stg_localbike_dataset__order_items')}}
  GROUP BY order_id
  )

SELECT 
  oi.order_id,
  o.customer_id,
  oi.total_order_amount,
  oi.total_items,
  oi.total_distinct_items,
  o.store_id,
  o.staff_id
FROM
  order_items_grouped_by_order oi
LEFT JOIN {{ ref('stg_localbike_dataset__orders')}} o
ON oi.order_id = o.order_id