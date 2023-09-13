{{ config(
    materialized='external', 
    location='./fact_company.parquet', 
    format="parquet") 
}}

SELECT {{ dbt_utils.generate_surrogate_key(['company', 'date_joined', 'industry']) }} AS company_sid
    ,date_joined
    ,valuation_billions
    ,1 as count_companies
FROM {{ ref('stage_companies') }}
