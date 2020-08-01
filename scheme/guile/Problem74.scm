;;; The number 145 is well known for the property that the sum of the factorial of
;;; its digits is equal to 145:
;;; 
;;; 1! + 4! + 5! = 1 + 24 + 120 = 145
;;; 
;;; Perhaps less well known is 169, in that it produces the longest chain of
;;; numbers that link back to 169; it turns out that there are only three such
;;; loops that exist:
;;; 
;;; 169 → 363601 → 1454 → 169
;;; 871 → 45361 → 871
;;; 872 → 45362 → 872
;;; 
;;; It is not difficult to prove that EVERY starting number will eventually get
;;; stuck in a loop. For example,
;;; 
;;; 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
;;; 78 → 45360 → 871 → 45361 (→ 871)
;;; 540 → 145 (→ 145)
;;; 
;;; Starting with 69 produces a chain of five non-repeating terms, but the longest
;;; non-repeating chain with a starting number below one million is sixty terms.
;;; 
;;; How many chains, with a starting number below one million, contain exactly
;;; sixty non-repeating terms?

(import (ice-9 poe))

(define (factorial x)
  (if (zero? x)
      1
      (* x (factorial (1- x)))))

(define (sum-digit-factorials x)
  (call-with-values (lambda ()
                      (floor/ x 10))
                    (lambda (q r)
                      (+ (factorial r)
                         (if (zero? q)
                             0
                             (sum-digit-factorials q))))))

(define (sum-digit-factorials-chain-length x)
  (case x
    ((1 2 145 40585) 1)
    ((871 872 45361 45362) 2)
    ((169 1454 363601) 3)
    (else (1+ (sum-digit-factorials-chain-length (sum-digit-factorials x))))))

(define sum-digit-factorials-chain-length
  (pure-funcq sum-digit-factorials-chain-length))

(display (length (filter (lambda (x)
                           (= 60 (sum-digit-factorials-chain-length x)))
                         (iota 1000000))))
(newline)
