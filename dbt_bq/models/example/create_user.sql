-- models/create_users_products_table.sql

{{ config(
    materialized='incremental', 
    unique_key='userid'
) }}

WITH source_data AS (
    SELECT
        9 AS userid,
        109 AS productid,
        'Male' AS usergender,
        TIMESTAMP('2023-07-04 10:01:00') AS updated_at
    UNION ALL
    SELECT
        10 AS userid,
        110 AS productid,
        'Female' AS usergender,
        TIMESTAMP('2023-07-04 10:02:00') AS updated_at
    {% if is_incremental() %}
    UNION ALL
    SELECT
        userid,
        productid,
        usergender,
        updated_at
    FROM {{ this }}
    {% endif %}
)

SELECT *
FROM source_data