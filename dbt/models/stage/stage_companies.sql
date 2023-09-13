SELECT Company AS company
    ,"Valuation ($B)"[2:]::FLOAT AS valuation_billions
    ,"Date Joined"::DATE AS date_joined
    ,Country AS country
    ,City AS city
    ,Industry AS industry
    ,str_split("Select Investors", ', ') AS select_investors
FROM read_csv_auto({{ source('csv_source', 'unicorn') }})
