SELECT hackers.hacker_id, hackers.name, SUM(submissions.score)
FROM hackers
INNER JOIN
submissions
ON
hackers.hacker_id = submissions.hacker_id
GROUP BY hackers.hacker_id, hackers.name
HAVING SUM(submissions.score) > 0
ORDER BY SUM(submissions.score) DESC, hackers.hacker_id ASC;