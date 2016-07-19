;;; 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
;;;
;;; What is the sum of the digits of the number 2^1000?

(define (digits x)
  (map (compose string->number
                string)
       (string->list
         (number->string x))))

(display
  (apply +
         (digits (expt 2 1000))))
