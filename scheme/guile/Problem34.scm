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
  (if (zero? x)
    '(0)
    (let loop ((x x)
               (result '()))
      (if (zero? x)
        result
        (call-with-values (lambda ()
                            (floor/ x 10))
                          (lambda (q r)
                            (loop q (cons r result))))))))

(define (factorion? x)
  (and (< 3 x)
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
