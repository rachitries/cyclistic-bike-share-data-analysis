SELECT
    rider_type,
    hour,
    COUNT(*) AS total_rides
FROM trips
GROUP BY rider_type, hour
ORDER BY hour, rider_type;
