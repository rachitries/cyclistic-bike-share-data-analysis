SELECT
	rider_type,
	CASE
		WHEN day_of_week IN ('Saturday', 'Sunday')
			THEN 'Weekend'
		ELSE 'Weekday'
	END AS day_type,
	COUNT(*) AS total_rides,
	ROUND(AVG(ride_length_minutes)::numeric, 2) AS avg_ride_length
FROM trips
GROUP BY rider_type, day_type
ORDER BY rider_type, day_type;