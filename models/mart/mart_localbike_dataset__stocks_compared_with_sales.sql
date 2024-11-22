SELECT
    s.stock_store_product_id,
    s.store_state,
    s.store_name,
    s.product_name,
    s.total_stock,
    coalesce(total_products_sold, 0) as total_products_sold,
    s.category_name
FROM 
    {{ ref('int_localbike_dataset__aggregated_stocks') }} s
LEFT JOIN 
    {{ ref('int_localbike_dataset__best_products') }} bp
    ON s.stock_store_product_id = bp.store_product_id
