;;; The following iterative sequence is defined for the set of positive integers:
;;; 
;;; n → n/2 (n is even)
;;; n → 3n + 1 (n is odd)
;;; 
;;; Using the rule above and starting with 13, we generate the following sequence:
;;; 
;;; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
;;; 
;;; It can be seen that this sequence (starting at 13 and finishing at 1) contains
;;; 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
;;; that all starting numbers finish at 1.
;;; 
;;; Which starting number, under one million, produces the longest chain?
;;; 
;;; NOTE: Once the chain starts the terms are allowed to go above one million.

(import (ice-9 poe))

(define-inlinable (collatz-next x)
  (if (even? x)
      (/ x 2)
      (+ x x x 1)))

(define (collatz-depth x)
  (if (= x 1)
      1
      (1+ (collatz-depth (collatz-next x)))))

(define collatz-depth
  (pure-funcq collatz-depth))

(display
  (let loop ((i 1)
             (deepest '(0 . 0)))
    (if (>= i 1000000)
        (car deepest)
        (loop (+ i 2)
              (let ((depth (collatz-depth i)))
                (if (> depth (cdr deepest))
                    (cons i depth)
                    deepest))))))
(newline)
