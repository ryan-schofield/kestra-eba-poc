{{ config(
    materialized='external', 
    location='./dim_date.parquet', 
    format="parquet") 
}}

SELECT date_id::DATE AS date_id
	,DATE_PART('DAYOFWEEK', date_id) AS day_of_week
	,DAYNAME(date_id) AS day_of_week_name
	,DATE_PART('WEEK', date_id) AS week_of_year
	,DATE_PART('YEAR', date_id) AS year_num
	,DATE_PART('YEAR', date_id)::STRING AS year_text
	,DATE_PART('MONTH', date_id) AS month_num
	,MONTHNAME(date_id) AS month_name
	,DATE_PART('QUARTER', date_id) AS quarter
	,DATE_PART('DAY', date_id) AS day_of_month
	,DATE_PART('DAYOFYEAR', date_id) AS day_of_year
	,MAKE_DATE(DATE_PART('YEAR', date_id), DATE_PART('MONTH', date_id), 1) AS month_start_date
	,LAST_DAY(date_id) AS month_end_date
	,MAKE_DATE(DATE_PART('YEAR', date_id), 1, 1) AS year_start_date
	,MAKE_DATE(DATE_PART('YEAR', date_id), 12, 31) AS year_end_date
FROM {{ ref('stage_dates') }}
