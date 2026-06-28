-- Task : Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
--  Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge.
--  Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
--  If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

SELECT 
    H.hacker_id,H.name
FROM Submissions AS S
JOIN  hackers AS H
    ON S.hacker_id = H.hacker_id
join Challenges  AS C
    ON S.challenge_id = C.challenge_id
join Difficulty AS D
    ON C.difficulty_level = D.difficulty_level
WHERE S.score = D.score
GROUP BY H.hacker_id , H.name
HAVING COUNT(S.challenge_id) > 1
ORDER BY COUNT(S.challenge_id) DESC, H.hacker_id ASC
;
