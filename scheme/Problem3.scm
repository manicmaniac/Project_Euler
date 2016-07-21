;;; The prime factors of 13195 are 5, 7, 13 and 29.
;;;
;;; What is the largest prime factor of the number 600851475143 ?

(define (factor n)
  (let loop ((n n)
             (d 2)
             (res '()))
    (cond ((< n d) res)
          ((zero? (modulo n d)) (loop (/ n d)
                                      d
                                      (cons d res)))
          (else (loop n
                      (1+ d)
                      res)))))


(display
  (car (factor 600851475143)))
(newline)
