
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

-- models/create_users_products_table.sql

{{ config(materialized='table') }}

WITH source_data AS (
    SELECT
        4 AS userid,
        101 AS productid,
        'Male' AS usergender
    UNION ALL
    SELECT
        5 AS userid,
        102 AS productid,
        'Female' AS usergender
    UNION ALL
    SELECT
        6 AS userid,
        103 AS productid,
        'Male' AS usergender

)

SELECT *
FROM source_data



/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
