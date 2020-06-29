;;; The prime factors of 13195 are 5, 7, 13 and 29.
;;;
;;; What is the largest prime factor of the number 600851475143 ?

(define (factorize x)
  (let loop ((x x)
             (y 2))
    (call-with-values (lambda ()
                        (floor/ x y))
                      (lambda (q r)
                        (cond ((zero? q) '())
                              ((zero? r) (cons y (loop q y)))
                              (else (loop x (1+ y))))))))

(display (apply max (factorize 600851475143)))
(newline)
