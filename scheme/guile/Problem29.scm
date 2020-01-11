;;; Consider all integer combinations of a^b for 2 ≤ a ≤ 5 and 2 ≤ b ≤ 5:
;;;
;;;     2^2=4, 2^3=8, 2^4=16, 2^5=32
;;;     3^2=9, 3^3=27, 3^4=81, 3^5=243
;;;     4^2=16, 4^3=64, 4^4=256, 4^5=1024
;;;     5^2=25, 5^3=125, 5^4=625, 5^5=3125
;;;
;;; If they are then placed in numerical order, with any repeats removed, we get
;;; the following sequence of 15 distinct terms:
;;;
;;; 4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125
;;;
;;; How many distinct terms are in the sequence generated by a^b for 2 ≤ a ≤ 100
;;; and 2 ≤ b ≤ 100?

(import (ice-9 receive)
        (srfi :1)
        (srfi :26))

(define (cartesian-product . lists)
  (fold-right (lambda (xs ys)
                (append-map (lambda (x)
                              (map (lambda (y)
                                     (cons x y))
                                   ys))
                            xs))
              '(())
              lists))

(display
  (let ((range (iota 99 2)))
    (length (delete-duplicates (map (lambda (x-and-y)
                                      (receive (x y)
                                               (apply values x-and-y)
                                               (expt x y)))
                                    (cartesian-product range range))))))
(newline)