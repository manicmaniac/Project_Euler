/* If we list all the natural numbers below 10 that are multiples of 3 or 5, we
 * get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
 */

WITH RECURSIVE range (i)
AS (
  SELECT 0
  UNION ALL
  SELECT i + 1
  FROM range
  LIMIT 1000
)
SELECT SUM(i)
FROM range
WHERE i % 3 = 0
OR i % 5 = 0;
