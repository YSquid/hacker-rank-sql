-- We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
-- Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

-- get the total_earning as months * salary
-- group by total_earnings
-- order by total earning descening to get highest, and limit it to 1
-- get count(*) - this returns how many records are in the top earning group
-- note: if you did the query without group by and set limit to say 10, it would show each of the 7 top earners. But group by aggregates them to one row in output. However count(*) still counts all 7 records
SELECT months * salary as total_earning, COUNT(*) FROM employee
GROUP BY total_earning
ORDER BY total_earning DESC LIMIT 1;