-- Consider  and  to be two points on a 2D plane.

--  happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
--  happens to equal the minimum value in Western Longitude (LONG_W in STATION).
--  happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
--  happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.

SELECT
    MIN(LAT_N) AS x1,
    MIN(LONG_W) AS y1,
    MAX(LAT_N) AS x2,
    MAX(LONG_W) AS y2,
    ABS(MIN(LAT_N) - MAX(LAT_N)) AS xdiff,
    ABS(MIN(LONG_W) - MAX(LONG_W)) AS ydiff,
    ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)),4) AS manhattan
FROM station;