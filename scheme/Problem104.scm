;;; The Fibonacci sequence is defined by the recurrence relation:
;;;
;;;     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
;;;
;;; It turns out that F[541], which contains 113 digits, is the first Fibonacci
;;; number for which the last nine digits are 1-9 pandigital (contain all the
;;; digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
;;; digits, is the first Fibonacci number for which the first nine digits are 1-9
;;; pandigital.
;;;
;;; Given that F[k] is the first Fibonacci number for which the first nine digits
;;; AND the last nine digits are 1-9 pandigital, find k.

(import (ice-9 receive)
        (rnrs base)
        (srfi :1)
        (srfi :41))

(define *log10-phi*
  (log10 (/ (1+ (sqrt 5))
            2)))

(define *log10-sqrt5*
  (/ (log10 5)
     2))

(define (fractional-part x)
  (- x
     (floor x)))

(define (first-9-digits-of-fibonaccies-at n)
  (inexact->exact (round (* 1e8
                            (expt 10
                                  (fractional-part (- (* *log10-phi*
                                                         (1+ n))
                                                      *log10-sqrt5*)))))))

(define last-9-digits-of-fibonaccies
  (stream-cons 1
               (stream-cons 1
                            (stream-map (lambda (x y)
                                          (modulo (+ x y)
                                                  1000000000))
                                        last-9-digits-of-fibonaccies
                                        (stream-cdr last-9-digits-of-fibonaccies)))))

(define (digits x)
  (let loop ((x x)
             (result '()))
    (if (zero? x)
      result
      (receive (quot rem)
               (div-and-mod x 10)
               (loop quot
                     (cons rem
                           result))))))

(define (pandigital? x)
  (lset= eqv?
         (digits x)
         (iota 9 1)))

(define (stream-enumerate stream n)
  (stream-zip (stream-from n)
              stream))

(define (stream-find pred stream)
  (stream-car (stream-filter pred
                             stream)))

(display
  (1+ (car (stream-find (lambda (index-and-x)
                          (receive (index x)
                                   (apply values
                                          index-and-x)
                                   (and (pandigital? x)
                                        (pandigital? (first-9-digits-of-fibonaccies-at index)))))
                        (stream-enumerate last-9-digits-of-fibonaccies 0)))))
(newline)
