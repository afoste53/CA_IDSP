-- Date pulled from
-- https://drive.google.com/file/d/1rydAepWim_Pi0Krh1-RoJjJjDKwc4Gpv/view 

-- How mant distinct zip-codes are there? 
SELECT COUNT(DISTINCT zip_code) AS 'Distinct Zip Codes' from home_value_data;

-- How many zips from each state?
SELECT state, COUNT(zip_code) from home_value_data GROUP BY 1;

-- What range of years are represented in the dataset
SELECT MIN(substr(date, 1,4)) AS 'Start Year', MAX(substr(date, 1,4)) AS 'End Year' from home_value_data;

-- Select Min and Max values for each state in the last month available
SELECT DISTINCT state, MIN(value), MAX(value) FROM home_value_data
WHERE date = (SELECT MAX(date) FROM home_value_data)
GROUP BY 1;

-- Using the most recent month of data available, which states have the highest average home values? How about the lowest?, Bottom 10
-- Top 10 
SELECT state, ROUND(AVG(value),0) AS 'Average Value' 
FROM home_value_data
WHERE date = (SELECT MAX(date) from home_value_data)
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Bottom 10 
SELECT state, ROUND(AVG(value),0) AS 'Average Value' 
FROM home_value_data
WHERE date = (SELECT MAX(date) from home_value_data)
GROUP BY 1
ORDER BY 2
LIMIT 10;

-- Which states have the highest and lowest average home value in 2017?
WITH average_tab AS(
SELECT state, ROUND(AVG(value), 0) AS averages
FROM home_value_data
WHERE date LIKE '%2017%' 
GROUP BY 1
ORDER BY 2 DESC
)
SELECT * FROM average_tab
WHERE averages=(SELECT MAX(averages) FROM average_tab) OR  averages=(SELECT MIN(averages) FROM average_tab);
