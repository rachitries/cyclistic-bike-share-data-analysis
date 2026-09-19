SELECT
    rider_type,
    rideable_type,
    COUNT(*) AS total_rides,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY rider_type),
        2
    ) AS percentage_within_rider_type
FROM trips
GROUP BY rider_type, rideable_type
ORDER BY rider_type, total_rides DESC;