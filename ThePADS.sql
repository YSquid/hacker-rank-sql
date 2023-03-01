
--SELECT a column that concatenates the persons name, plus the first letter of their occupation in parentheses. Call this column A
SELECT CONCAT(Name, "(", SUBSTRING(Occupation, 1, 1), ")") AS A
FROM Occupations
UNION

--UNION (i.e one set of rows on top of another)
--SELECT a column that concatenates a string, the count of each occupation, and that occupdation in lower case, with "s."
-- Also call this column A so that its all going in one column
-- Group by occupation for the aggregate COUNT function
-- Order the joined tables by A - worked in this case as all names were higher than T, so put them first, then all the "There are..". Might not have worked with other data
SELECT CONCAT("There are a total of ", COUNT(Occupation), " ", LOWER(Occupation), "s.") AS A FROM Occupations
GROUP BY Occupation
ORDER BY A;