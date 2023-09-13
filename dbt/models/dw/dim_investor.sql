{{ config(
    materialized='external', 
    location='./dim_investor.parquet', 
    format="parquet") 
}}

SELECT DISTINCT {{ dbt_utils.generate_surrogate_key(['investor']) }} AS investor_sid
    ,investor
FROM {{ ref('stage_investors') }}
