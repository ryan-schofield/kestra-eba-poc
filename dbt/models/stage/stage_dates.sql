SELECT generate_series AS date_id
FROM generate_series(TIMESTAMP '2011-04-02', TIMESTAMP '2023-03-14', interval '1 days')
