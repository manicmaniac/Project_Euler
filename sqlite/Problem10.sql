/* The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */
CREATE TABLE naturals (
  n INTEGER PRIMARY KEY,
  is_prime BOOL NOT NULL DEFAULT 1
);

WITH RECURSIVE range (i)
AS (
  SELECT 2
  UNION ALL
  SELECT i + 1
  FROM range
  LIMIT 2000000 - 2
)
INSERT INTO naturals (n)
SELECT i
FROM range;

REPLACE INTO naturals
  WITH RECURSIVE product (i, j)
  AS (
    SELECT n, n * n AS square_n
      FROM naturals
      WHERE square_n <= (SELECT MAX(n) FROM naturals)
    UNION ALL
    SELECT i, i + j AS added
    FROM product
    WHERE added <= (SELECT MAX(n) FROM naturals)
  )
  SELECT n, 0
  FROM product
  JOIN naturals
    ON product.j = naturals.n;

SELECT SUM(n)
FROM naturals
WHERE is_prime;
