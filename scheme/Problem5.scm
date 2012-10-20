#|
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
|#

(define (gcd x y)
  (if (< x y)
    (gcd y x)
    (if (= y 0)
      x
      (gcd y (remainder x y)))))

(define (lcm x y)
  (/ (* x y) (gcd x y)))

(define (loop res xs)
  (if (null? xs)
    res
    (loop (lcm (car xs) res) (cdr xs))))

(display (loop 1 (list 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)))

