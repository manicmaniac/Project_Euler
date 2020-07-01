;;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;;;
;;; Find the sum of all the primes below two million.

(define (primes-upto limit)
  (let ((bv (make-bitvector limit #t))
        (sqrt-limit (exact-integer-sqrt limit)))
    (bitvector-set! bv 0 #f)
    (bitvector-set! bv 1 #f)
    (do ((i 2 (1+ i)))
      ((> i sqrt-limit))
      (and (bitvector-ref bv i)
           (do ((j (* i i) (+ j i)))
             ((>= j limit))
             (bitvector-set! bv j #f))))
    (let loop ((i (1- limit))
               (primes '()))
      (if (negative? i)
          primes
          (loop (1- i)
                (if (bitvector-ref bv i)
                    (cons i primes)
                    primes))))))

(display (apply + (primes-upto 2000000)))
(newline)
