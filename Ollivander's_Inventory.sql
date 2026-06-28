-- Task : Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
-- Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age.
-- Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power.
-- If more than one wand has same power, sort the result in order of descending age.

WITH CTE AS(
SELECT W.id, WP.age, W.coins_needed, W.power,
ROW_NUMBER() OVER(PARTITION BY WP.age, W.power ORDER BY W.coins_needed ASC) ROW_NUM
FROM Wands AS W
JOIN Wands_Property AS WP
    ON W.code = WP.code
WHERE WP.is_evil = 0
)
SELECT id,age,coins_needed,power
FROM CTE
WHERE ROW_NUM = 1
ORDER BY power DESC , age DESC
;
