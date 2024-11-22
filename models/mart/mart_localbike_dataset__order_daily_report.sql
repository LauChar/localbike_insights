SELECT
    order_date as report_date,
    customer_state,
    store_name,
    coalesce(staff_first_name, ' ', staff_last_name) as staff_name,
    COUNT(DISTINCT order_id) AS total_orders,
    AVG(total_distinct_items) AS average_total_distinct_items,
    AVG(total_order_amount) AS average_total_order_amount
FROM {{ ref('int_localbike_dataset__orders') }} AS orders
LEFT JOIN
    {{ ref('stg_localbike_dataset__staffs') }} staffs
    ON orders.staff_id = staffs.staff_id
LEFT JOIN
    {{ ref('stg_localbike_dataset__stores') }} stores
    ON orders.store_id = stores.store_id
GROUP BY
    report_date,
    customer_state,
    store_name,
    staff_name