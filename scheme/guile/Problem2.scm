;;; Each new term in the Fibonacci sequence is generated by adding the previous two
;;; terms. By starting with 1 and 2, the first 10 terms will be:
;;;
;;; 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
;;;
;;; By considering the terms in the Fibonacci sequence whose values do not exceed
;;; four million, find the sum of the even-valued terms.

(import (srfi :41))

(define fibonaccies
  (stream-cons 1
               (stream-cons 1
                            (stream-map +
                                        (stream-cdr fibonaccies)
                                        fibonaccies))))

(display
  (stream-fold +
               0
               (stream-filter even?
                              (stream-take-while (lambda (x)
                                                   (< x 4e6))
                                                 fibonaccies))))
(newline)