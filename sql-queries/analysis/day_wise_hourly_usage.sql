SELECT
    rider_type,
    CASE
        WHEN day_of_week IN ('Saturday', 'Sunday')
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    hour,
    COUNT(*) AS total_rides
FROM trips
GROUP BY rider_type, day_type, hour
ORDER BY rider_type, day_type, hour;