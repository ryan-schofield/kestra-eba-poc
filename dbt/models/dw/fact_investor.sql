{{ config(
    materialized='external', 
    location='./fact_investor.parquet', 
    format="parquet") 
}}

SELECT {{ dbt_utils.generate_surrogate_key(['investor']) }} AS investor_sid
    ,{{ dbt_utils.generate_surrogate_key(['company', 'date_joined', 'industry']) }} AS company_sid
    ,date_joined
    ,1 as count_investors
FROM {{ ref('stage_investors') }}
