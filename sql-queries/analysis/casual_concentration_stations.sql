SELECT
    start_station_name,
    start_lat,
    start_lng,
    COUNT(*) AS total_rides,
    COUNT(*) FILTER (
        WHERE rider_type = 'casual'
    ) AS casual_rides,
    ROUND(
        COUNT(*) FILTER (
            WHERE rider_type = 'casual'
        ) * 100.0 / COUNT(*),
        2
    ) AS casual_percentage
FROM trips
WHERE start_station_name IS NOT NULL
  AND start_lat IS NOT NULL
  AND start_lng IS NOT NULL
GROUP BY
    start_station_name,
    start_lat,
    start_lng
HAVING COUNT(*) >= 100
ORDER BY casual_percentage DESC;