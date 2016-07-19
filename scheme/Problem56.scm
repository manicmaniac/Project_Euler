;;; A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^
;;; 100 is almost unimaginably large: one followed by two-hundred zeros. Despite
;;; their size, the sum of the digits in each number is only 1.
;;;
;;; Considering natural numbers of the form, a^b, where a, b < 100, what is the
;;; maximum digital sum?

(import (srfi :1))

(define (digits x)
  (map (compose string->number
                string)
       (string->list
         (number->string x))))


(display
  (apply max
         (concatenate
           (let ((range (iota 100)))
             (map (lambda (b)
                    (map (lambda (a)
                           (apply +
                                  (digits (expt a b))))
                         range))
                  range)))))
(newline)
