-- Task : Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
-- Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. 
-- If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

SELECT
    H.hacker_id,
    H.name,
    COUNT(C.challenge_id) AS total_challenges
FROM Hackers H
JOIN Challenges C
    ON H.hacker_id = C.hacker_id
GROUP BY
    H.hacker_id,
    H.name
HAVING
    COUNT(C.challenge_id) = (
        SELECT MAX(challenge_count)
        FROM (
            SELECT COUNT(challenge_id) AS challenge_count
            FROM Challenges
            GROUP BY hacker_id
        ) AS T
    )
    OR COUNT(C.challenge_id) IN (
        SELECT challenge_count
        FROM (
            SELECT COUNT(challenge_id) AS challenge_count
            FROM Challenges
            GROUP BY hacker_id
        ) AS T
        GROUP BY challenge_count
        HAVING COUNT(*) = 1
    )
ORDER BY
    total_challenges DESC,
    H.hacker_id ASC;
