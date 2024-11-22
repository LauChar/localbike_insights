WITH order_items_grouped_by_product_id AS (
  SELECT
    CONCAT(store_id, '_', product_id) as store_product_id,
    store_id,
    product_id,
    sum(product_quantity) as total_products_sold,
    sum(total_order_item_amount) total_products_sold_amount
  FROM {{ ref('int_localbike_dataset__order_items') }}
  GROUP BY store_id, product_id
  )

SELECT 
    oip.store_product_id,
    oip.store_id,
    s.store_name,
    oip.product_id,
    p.product_name,
    oip.total_products_sold,
    oip.total_products_sold_amount
FROM order_items_grouped_by_product_id AS oip
LEFT JOIN {{ ref('stg_localbike_dataset__products') }} AS p
    ON oip.product_id = p.product_id
LEFT JOIN {{ ref('stg_localbike_dataset__stores') }} AS s
    ON oip.store_id = s.store_id