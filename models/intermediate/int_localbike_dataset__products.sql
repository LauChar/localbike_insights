SELECT
    product_id,
    product_name,
    category_name,
    model_year,
    product_price
FROM 
    {{ ref('stg_localbike_dataset__products') }} p
LEFT JOIN
    {{ ref('stg_localbike_dataset__categories') }} c
    ON p.category_id = c.category_id