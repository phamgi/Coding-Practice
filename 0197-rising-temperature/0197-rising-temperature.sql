# Write your MySQL query statement below
WITH cte AS
(SELECT
    *, 
    DATE_ADD(recordDate, INTERVAL -1 DAY) AS yesterdays_date, 
    LAG(recordDate) OVER(ORDER BY recordDate) AS prev_recordDate,
    LAG(temperature) OVER(ORDER BY recordDate) AS prev_temp
FROM
    Weather)
    

SELECT 
    id
FROM 
    cte
WHERE 
    yesterdays_date = prev_recordDate
AND
    temperature > prev_temp