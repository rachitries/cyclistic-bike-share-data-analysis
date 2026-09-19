SELECT
    rider_type,
    day_of_week,
    hour,
    COUNT(*) AS total_rides
FROM trips
GROUP BY
    rider_type,
    day_of_week,
    hour
ORDER BY

    CASE day_of_week
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END,
    hour,
	rider_type;
