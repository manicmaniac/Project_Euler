;;; 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
;;;
;;; What is the sum of the digits of the number 2^1000?

(define (digits x)
  (if (zero? x) 0
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
         (digits (expt 2 1000))))
(newline)
