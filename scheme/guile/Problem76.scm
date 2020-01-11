;;; It is possible to write five as a sum in exactly six different ways:
;;;
;;; 4 + 1
;;; 3 + 2
;;; 3 + 1 + 1
;;; 2 + 2 + 1
;;; 2 + 1 + 1 + 1
;;; 1 + 1 + 1 + 1 + 1
;;;
;;; How many different ways can one hundred be written as a sum of at least two
;;; positive integers?

(import (ice-9 poe))

(define (npartitions k n)
  (cond ((> k n) 0)
        ((= k n) 1)
        (else (+ (npartitions (1+ k) n)
                 (npartitions k (- n k))))))

(define npartitions
  (pure-funcq npartitions))

(display
  (npartitions 1 100))
(newline)
