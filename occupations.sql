SELECT
--then we create 4 columns with case statements in each, matching the occupation and returning name, or returning null
--need to use either max or min to aggregate values for some reason? 
MAX(CASE WHEN Occupation="Doctor" THEN name ELSE NULL END) AS Doctor,
MAX(CASE WHEN Occupation="Professor" THEN name ELSE NULL END) AS Professor,
MAX(CASE WHEN Occupation="Singer" THEN name ELSE NULL END) AS Singer,
MAX(CASE WHEN Occupation="Actor" THEN name ELSE NULL END) AS Actor
FROM
-- this inner query returns the name, occuptation, and row number per window partitioned by occupation, ordered by name
--e.g.
--Eve | Actor | 1
--Jenniger |Actor | 2
--Kerry |Actor | 3
-- Sam | Actor | 4
--Aamina | Doctor | 1
--Julia | Doctor | 2
--Priya | Doctor | 3
(SELECT name, occupation, row_number() over (partition by occupation order by name) as occ
from occupations) as temp group by occ