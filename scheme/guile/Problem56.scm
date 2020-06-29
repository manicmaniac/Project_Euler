;;; A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^
;;; 100 is almost unimaginably large: one followed by two-hundred zeros. Despite
;;; their size, the sum of the digits in each number is only 1.
;;;
;;; Considering natural numbers of the form, a^b, where a, b < 100, what is the
;;; maximum digital sum?

(import (srfi :1))

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
  (apply max
         (let ((range (iota 100)))
           (map (lambda (x+y)
                  (call-with-values (lambda ()
                                      (apply values x+y))
                                    (lambda (x y)
                                      (apply +
                                             (digits (expt x y))))))
                (cartesian-product range range)))))
(newline)
