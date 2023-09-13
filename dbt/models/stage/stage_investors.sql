SELECT company
    ,date_joined
    ,industry
    ,unnest(select_investors) AS investor
FROM {{ ref('stage_companies') }}
