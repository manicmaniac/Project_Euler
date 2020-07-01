;;; n! means n × (n − 1) × ... × 3 × 2 × 1
;;;
;;; For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
;;; and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
;;;
;;; Find the sum of the digits in the number 100!

(define (factorial x)
  (if (= x 1)
    1
    (* x (factorial (1- x)))))

(define (digits x)
  (if (zero? x)
    0
    (let loop ((x x)
               (result '()))
      (if (zero? x)
        result
        (call-with-values (lambda ()
                            (floor/ x 10))
                          (lambda (q r)
                            (loop q (cons r result))))))))

(display
  (apply +
         (digits (factorial 100))))
(newline)
