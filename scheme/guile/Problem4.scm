;;; A palindromic number reads the same both ways. The largest palindrome made from
;;; the product of two 2-digit numbers is 9009 = 91 × 99.
;;;
;;; Find the largest palindrome made from the product of two 3-digit numbers.

(import (srfi :1))

(define (palindrome? x)
  (let ((s (number->string x)))
    (string=? s (string-reverse s))))

(define (product-of-3digits? x)
  (let loop ((i 100)
             (sqrt-x (sqrt x)))
    (and (> sqrt-x i)
         (or (and (zero? (modulo x i))
                  (< (/ x i) 1000))
             (loop (1+ i) sqrt-x)))))

(display
  (find (lambda (x)
          (and (palindrome? x)
               (product-of-3digits? x)))
        (reverse (iota 998001))))
(newline)
