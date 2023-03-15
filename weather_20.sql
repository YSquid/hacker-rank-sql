-- A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

--sort the range and set row indexes for each row

-- set the user defined variable. Note the @variable := x syntax
--start it at -1, so that our first row will be indexed as zero
SET @rowindex := -1;

SELECT
--from the inner table, select average of LAT_N, using where clause below. Round to 4 places.
ROUND(AVG (SUB.LAT_N),4)
FROM
--this will create a row index for each matching row of LAT_N, incrememted by one each time
--this will create my inner table with all the values ordered, with a row index
(SELECT @rowindex:=@rowindex + 1 AS rowindex, station.LAT_N AS LAT_N
FROM STATION
ORDER BY STATION.LAT_N) AS SUB

-- I want to select where the row index is the middle value
-- for odd number of rows, i.e. 5 rows, index goes from 0 to 4. @rowindex is therefore equal to 4 in this case. FLOOR of 4/2 is 2, and CEIL of 4/2 is 2. It will select the value with rowindex of 2. I take the average above.
-- for even number of rows i.e. 6 rows, index goes from 0 to 5. @rowindex is therefore equal to 5 in this case. FLOOR of 5/2 is 2, and CEIL of 5/2 is 3. It will select the values with row index of 2 and 3. I take the average of these in the select above
WHERE SUB.rowindex IN (FLOOR(@rowindex / 2), CEIL(@rowindex/2));