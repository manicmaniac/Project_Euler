;;; 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
;;;
;;; Find the sum of all numbers which are equal to the sum of the factorial of their digits.
;;;
;;; Note: as 1! = 1 and 2! = 2 are not sums they are not included.

(define (factorial x)
  (if (zero? x)
    1
    (* x (factorial (1- x)))))

(define (digits x)
  (if (< x 10)
    (list x)
    (append (digits (floor/ x 10))
            (list (modulo x 10)))))

(define (factorion? x)
  (if (< x 3)
    #f
    (eqv? x
          (apply +
                (map factorial
                      (digits x))))))

(display
  (apply +
         (filter factorion?
                 (iota (* 7
                          (factorial 9))))))
(newline)
