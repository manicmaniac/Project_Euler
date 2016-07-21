;;; It is possible to show that the square root of two can be expressed as an
;;; infinite continued fraction.
;;;
;;; √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
;;;
;;; By expanding this for the first four iterations, we get:
;;;
;;; 1 + 1/2 = 3/2 = 1.5
;;; 1 + 1/(2 + 1/2) = 7/5 = 1.4
;;; 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
;;; 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
;;;
;;; The next three expansions are 99/70, 239/169, and 577/408, but the eighth
;;; expansion, 1393/985, is the first example where the number of digits in the
;;; numerator exceeds the number of digits in the denominator.
;;;
;;; In the first one-thousand expansions, how many fractions contain a numerator
;;; with more digits than denominator?

(import (srfi :1))

(define (sqrt2-with-continued-fraction accuracy)
  (1+ (let loop ((x 1/2)
                 (accuracy accuracy))
        (if (zero? accuracy)
          x
          (loop (/ 1 (+ 2 x))
                (1- accuracy))))))

(define digits-length
  (compose 1+
           inexact->exact
           floor
           log10))

(display
  (count (lambda (x)
           (> (digits-length (numerator x))
              (digits-length (denominator x))))
         (map sqrt2-with-continued-fraction
              (iota 1000))))
(newline)
