;;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;;;
;;; Find the sum of all the primes below two million.

(import (srfi :1))

(define (primes-upto limit)
  (let ((bv (make-bitvector limit #t))
        (sqrt-limit (sqrt limit)))
    (bitvector-set! bv 0 #f)
    (bitvector-set! bv 1 #f)
    (let loop ((i 2))
      (when (< i sqrt-limit)
        (and (bitvector-ref bv i)
            (let loop2 ((j (* i i)))
              (when (< j limit)
                (bitvector-set! bv j #f)
                (loop2 (+ j i)))))
        (loop (1+ i))))
    (map cadr (filter car (zip (bitvector->list bv)
                               (iota limit))))))

(display (apply + (primes-upto 2000000)))
(newline)
