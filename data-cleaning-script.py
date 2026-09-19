import glob
import os
import pandas as pd

# Set float format to 2 decimal places
pd.set_option('display.float_format', '{:.2f}'.format)

# Path configurations
input_path = "data/raw"
output_path = "data/cleaned"

# Import all CSV files from the input directory
files = glob.glob(f'{input_path}/*.csv')

dfs = []

for file in files:
    df = pd.read_csv(file)
    dfs.append(df)

bike_data = pd.concat(dfs, ignore_index=True)

# Rename the 'member_casual' column to 'rider_type'
bike_data.rename(columns={'member_casual': 'rider_type'}, inplace=True)

# Convert the 'started_at' column to datetime format
bike_data['started_at'] = pd.to_datetime(bike_data['started_at'])

# Convert the 'ended_at' column to datetime format
bike_data['ended_at'] = pd.to_datetime(bike_data['ended_at'])

# Calculate ride duration
bike_data['ride_length_minutes'] = bike_data['ended_at'] - bike_data['started_at']

# Convert to minutes
bike_data['ride_length_minutes'] = round(bike_data['ride_length_minutes'].dt.total_seconds() / 60, 2)

# Filter out negative ride durations
bike_data = bike_data[bike_data['ride_length_minutes'] > 0]

# Add a new column for the day of the week
bike_data['day_of_week'] = bike_data['started_at'].dt.day_name()

# Add a new column for the month
bike_data['month'] = bike_data['started_at'].dt.month_name()

# Add a new column for the hour of the day
bike_data['hour'] = bike_data['started_at'].dt.hour

# Drop duplicate rows based on 'ride_id', keeping the first occurrence
bike_data = bike_data.drop_duplicates(subset="ride_id", keep="first")

# Create the directory if it doesn't exist
os.makedirs(output_path, exist_ok=True)

# Save the cleaned data
bike_data.to_csv(f"{output_path}/cyclistic-bike-share-cleaned.csv", index=False)

print(f"Data cleaning completed. Cleaned data saved to '{output_path}/cyclistic-bike-share-cleaned.csv'.")