{{
    config(
        materialized='incremental'
    )
}}

SELECT * FROM  {{ var('model4_table_1') }}
UNION ALL
SELECT * FROM {{ var('model4_table_2') }}
UNION ALL 
SELECT * FROM {{ var('model4_table_3') }}
