{{ config(
    materialized='external', 
    location='./dim_company.parquet', 
    format="parquet") 
}}

SELECT {{ dbt_utils.generate_surrogate_key(['company', 'date_joined', 'industry']) }} AS company_sid
    ,company AS company_name
    ,date_joined
    ,country
    ,city
    ,industry
FROM {{ ref('stage_companies') }}
