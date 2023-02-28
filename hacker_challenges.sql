WITH 
--first CTE has the hacker_id, the name, and the count of challenges for each hacker i.e

    -- hacker_id| name | challenge_totalt1
    --  5120     Angela 50
    --  4356     Buck   50
    --  45125    Jose   45
    --  123512   Susan  45
    --  21312    Bill   18
    t1 AS
    (
    SELECT Hackers.hacker_id AS hackerid, Hackers.name AS name, COUNT(Challenges.challenge_id) AS challenge_totalt1
    FROM Hackers
    JOIN Challenges ON Hackers.hacker_id = Challenges.hacker_id
    GROUP BY Hackers.hacker_id, Hackers.name
    ),
    --second cte has the challenge totals from t1, saved in a new variable, and the count of each total i.e

        -- total2 | count_of_count
        -- 50       2
        -- 45       2
        -- 18       1
    t2 AS (
    SELECT challenge_totalt1 AS totalt2, COUNT(challenge_totalt1) AS count_of_count 
    FROM t1
    GROUP BY challenge_totalt1)

--result selects from t1 - id, name, and challenge total
-- where clauses
  -- 1) challenege total is equal to the value returned from selecting the max challenge total from t1 OR
  -- 2) challenge total includes all challenge totals where the count_of_count (i.e. number of people making this many challenges) is 1.
-- order it by the total challenges made descending, secondary order by hacker id ascending
SELECT hackerid, name, challenge_totalt1 from t1
WHERE 
challenge_totalt1 = (SELECT MAX(challenge_totalt1) FROM t1)
OR
challenge_totalt1 IN (SELECT totalt2 FROM t2 WHERE count_of_count = 1)
ORDER BY t1.challenge_totalt1 DESC, t1.hackerid;
