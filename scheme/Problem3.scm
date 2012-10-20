#|
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
|#

(define (factorize n)
  (define (loop n d res)
    (if (< n d)
      res
      (if (= 0 (remainder n d))
	(loop (/ n d) d (cons d res))
	(loop n (+ d 1) res))))
  (loop n 2 ()))

(display (car (factorize 600851475143)))

