SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT ride_id) AS unique_rides,
    COUNT(*) - COUNT(DISTINCT ride_id) AS duplicate_rides,
    COUNT(*) FILTER (WHERE rider_type IS NULL) AS missing_rider_type,
    COUNT(*) FILTER (WHERE ride_length_minutes IS NULL) AS missing_ride_length
FROM trips;