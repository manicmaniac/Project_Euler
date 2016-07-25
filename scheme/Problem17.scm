;;; If the numbers 1 to 5 are written out in words: one, two, three, four, five,
;;; then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
;;;
;;; If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
;;; words, how many letters would be used?
;;;
;;;
;;; NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
;;; forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
;;; letters. The use of "and" when writing out numbers is in compliance with
;;; British usage.

(import (ice-9 receive)
        (rnrs base)
        (srfi :1))

(define (number->english x)
  (let ((alist '((0 . "")
                 (1 . "one")
                 (2 . "two")
                 (3 . "three")
                 (4 . "four")
                 (5 . "five")
                 (6 . "six")
                 (7 . "seven")
                 (8 . "eight")
                 (9 . "nine")
                 (10 . "ten")
                 (11 . "eleven")
                 (12 . "twelve")
                 (13 . "thirteen")
                 (14 . "fourteen")
                 (15 . "fifteen")
                 (16 . "sixteen")
                 (17 . "seventeen")
                 (18 . "eighteen")
                 (19 . "nineteen")
                 (20 . "twenty")
                 (30 . "thirty")
                 (40 . "forty")
                 (50 . "fifty")
                 (60 . "sixty")
                 (70 . "seventy")
                 (80 . "eighty")
                 (90 . "ninety")
                 (100 . "handred")
                 (1000 . "onethousand"))))
    (cond ((<= x 20) (assv-ref alist x))
          ((< x 100) (receive (quot rem)
                               (div-and-mod x 10)
                               (string-append (assv-ref alist (* 10 quot))
                                              (number->english rem))))
          ((eqv? x 100) (string-append (assv-ref alist 1)
                                       (assv-ref alist 100)))
          ((< x 1000) (receive (quot rem)
                               (div-and-mod x 100)
                               (string-append (assv-ref alist quot)
                                              (assv-ref alist 100)
                                              (if (zero? rem)
                                                ""
                                                "and")
                                              (number->english rem))))
          ((eqv? x 1000) (assv-ref alist x)))))

(display
  (apply +
         (map (compose string-length number->english)
              (iota 1000 1))))
(newline)
