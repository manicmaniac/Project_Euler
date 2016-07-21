;;; n! means n × (n − 1) × ... × 3 × 2 × 1
;;;
;;; For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
;;; and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
;;;
;;; Find the sum of the digits in the number 100!

(define (factorial x)
  (if (eqv? x 1)
    1
    (* x (factorial (1- x)))))

(define (digits x)
  (map (compose string->number string)
       (string->list
         (number->string x))))

(display
  (apply +
         (digits (factorial 100))))
(newline)
