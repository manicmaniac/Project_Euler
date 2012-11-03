#|
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
|#

(define (loop n res)
  (if (< n 1)
    res
    (loop (- n 1) (+ (expt n n) res))))

(define (last10digits n)
  (remainder n (expt 10 10)))

(display (last10digits (loop 1000 0)))

