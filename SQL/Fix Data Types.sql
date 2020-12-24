SELECT
ID AS surrogate_id,
CASE WHEN ISNUMERIC(altitude)=1 THEN CAST(altitude AS DECIMAL(8,3)) ELSE NULL END altitude,
CASE WHEN LEN(position_lat) > 5 THEN CAST(position_lat AS decimal(10))/11930464.7111 ELSE NULL END lat,
CASE WHEN LEN(position_long) > 5 THEN CAST(position_long AS decimal(10))/11930464.7111 ELSE NULL END longitude,
CASE WHEN ISNUMERIC(heart_rate)=1 THEN CAST(heart_rate AS DECIMAL(5)) ELSE NULL END heart_rate,
CASE WHEN ISNUMERIC(distance)=1 THEN CAST(distance AS DECIMAL(8,3)) ELSE NULL END distance,
CASE WHEN ISNUMERIC(speed)=1 THEN CAST(speed AS DECIMAL(8,3)) ELSE NULL END speed,
CONVERT(Datetime, timestamp, 120) timestamp_is
INTO dbo.myrecord
FROM [dbo].[new.record]

select top 100 * from dbo.myrecord --confirms new table

select top 237 * from dbo.new_lap

SELECT
ID AS surrogate_id,
CASE WHEN ISNUMERIC(avg_heart_rate)=1 THEN CAST(avg_heart_rate AS decimal(5)) ELSE NULL END avg_heart_rate,
CASE WHEN ISNUMERIC(avg_speed)=1 THEN CAST(avg_speed AS DECIMAL(8,3)) ELSE NULL END avg_speed,
CASE WHEN ISNUMERIC(max_heart_rate)=1 THEN CAST(max_heart_rate AS decimal(5)) ELSE NULL END max_heart_rate,
CASE WHEN ISNUMERIC(max_speed)=1 THEN CAST(max_speed AS DECIMAL(8,3)) ELSE NULL END max_speed,
CASE WHEN LEN(end_position_lat) > 5 THEN CAST(end_position_lat AS decimal(10))/11930464.7111 ELSE NULL END end_latitude,
CASE WHEN LEN(end_position_long) > 5 THEN CAST(end_position_long AS decimal(10))/11930464.7111 ELSE NULL END end_longitude,
CASE WHEN LEN(start_position_lat) > 5 THEN CAST(start_position_lat AS decimal(10))/11930464.7111 ELSE NULL END start_latitude,
CASE WHEN LEN(start_position_long) > 5 THEN CAST(start_position_long AS decimal(10))/11930464.7111 ELSE NULL END start_longitude,
lap_trigger AS lap_trigger,
--CASE WHEN LEN(start_time) > 2 THEN CONVERT(datetime, start_time, 120) ELSE NULL END start_time,
CASE WHEN LEN(timestamp) > 2 THEN CONVERT(Datetime, timestamp, 120) ELSE NULL END end_time
FROM dbo.new_lap