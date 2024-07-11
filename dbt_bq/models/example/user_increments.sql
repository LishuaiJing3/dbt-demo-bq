-- models/incremental_users_products_table.sql

{{ config(
    materialized='incremental',
    unique_key='userid'
) }}

WITH new_data AS (
    SELECT *
    FROM {{ ref('create_user') }}
    {% if is_incremental() %}
    WHERE updated_at > (SELECT max(updated_at) FROM {{ this }})
    {% endif %}
)

SELECT *
FROM new_data

