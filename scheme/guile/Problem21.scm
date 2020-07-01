;;; Let d(n) be defined as the sum of proper divisors of n (numbers less than n
;;; which divide evenly into n).
;;; If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
;;; each of a and b are called amicable numbers.
;;;
;;; For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
;;; and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
;;; 142; so d(284) = 220.
;;;
;;; Evaluate the sum of all the amicable numbers under 10000.

(import (srfi :1))

(define (factor x)
  (let loop ((x x)
             (divisor 2)
             (result '()))
    (if (< x divisor)
        result
        (call-with-values (lambda ()
                            (floor/ x divisor))
                          (lambda (q r)
                            (if (zero? r)
                                (loop q divisor (cons divisor result))
                                (loop x (1+ divisor) result)))))))

(define (counter lst)
  (fold-right (lambda (x alist)
                (assv-set! alist
                           x
                           (1+ (or (assv-ref alist x)
                                   0))))
              '()
              lst))

(define (sum-of-divisors x)
  (- (apply *
            (map (lambda (key-and-value)
                   (let ((key (car key-and-value))
                         (value (cdr key-and-value)))
                     (1+ (let loop ((x key)
                                    (n value)
                                    (result 0))
                           (if (zero? n)
                               result
                               (loop x
                                     (1- n)
                                     (+ result (expt x n))))))))
                 (counter (factor x))))
     x))

(define (has-amicable? x)
  (let ((divisor-x (sum-of-divisors x)))
    (and (not (= x divisor-x))
         (= x (sum-of-divisors divisor-x)))))

(display
  (apply +
         (filter has-amicable?
                 (iota 9998 2))))
(newline)
