SELECT
    rider_type,
    COUNT(*) AS total_rides,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS ride_share_percent,
    ROUND(AVG(ride_length_minutes)::numeric, 2) AS avg_ride_length,
    ROUND(PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY ride_length_minutes)::numeric, 2
    ) AS median_ride_length
FROM trips
GROUP BY rider_type
ORDER BY rider_type;