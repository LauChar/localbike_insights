SELECT
    CONCAT(stocks.store_id, '_', stocks.product_id) as stock_store_product_id,
    stocks.store_id,
    stores.store_state,
    stores.store_name,
    stocks.product_id,
    p.product_name,
    sum(stock_quantity) as total_stock
FROM {{ ref('stg_localbike_dataset__stocks') }} stocks
LEFT JOIN {{ ref('stg_localbike_dataset__stores') }} stores 
  ON stocks.store_id = stores.store_id
LEFT JOIN {{ ref('stg_localbike_dataset__products') }} p
  ON stocks.product_id = p.product_id
GROUP BY store_id, store_state, store_name, product_id, product_name