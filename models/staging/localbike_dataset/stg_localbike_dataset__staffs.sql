SELECT
    staff_id,
    first_name as staff_first_name,
    last_name as staff_last_name,
    email as staff_email,
    phone as staff_phone,
    active,
    store_id,
    manager_id
FROM {{ source('localbike_dataset', 'staffs') }}