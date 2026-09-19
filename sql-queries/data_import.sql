-- Make sure to replace the file path below with your csv file path
\copy trips FROM '/home/rachitries/GoogleDA/case study/cyclistic-bike-share-data-analysis/data/cleaned/cyclistic-bike-share-cleaned.csv'WITH (FORMAT csv, HEADER true, DELIMITER ',');

/*
- If you want to import data through GUI -

1. Open pgAdmin4, connect to your database
2. Right-click the target table → Import/Export Data
3. Set Import, select your cleaned CSV file
4. Format: CSV, Header: Yes, Delimiter: ,
5. Match columns as needed → click OK
*/
