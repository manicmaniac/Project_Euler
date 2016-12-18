;;; Euler discovered the remarkable quadratic formula:
;;;
;;; $n^2 + n + 41$
;;;
;;; It turns out that the formula will produce 40 primes for the consecutive
;;; integer values $0 \le n \le 39$. However, when $n = 40, 40^2 + 40 + 41 = 40(40
;;; + 1) + 41$ is divisible by 41, and certainly when $n = 41, 41^2 + 41 + 41$ is
;;; clearly divisible by 41.
;;;
;;; The incredible formula $n^2 - 79n + 1601$ was discovered, which produces 80
;;; primes for the consecutive values $0 \le n \le 79$. The product of the
;;; coefficients, −79 and 1601, is −126479.
;;;
;;; Considering quadratics of the form:
;;;
;;;     $n^2 + an + b$, where $|a| < 1000$ and $|b| \le 1000$
;;;
;;;     where $|n|$ is the modulus/absolute value of $n$
;;;     e.g. $|11| = 11$ and $|-4| = 4$
;;;
;;; Find the product of the coefficients, $a$ and $b$, for the quadratic expression
;;; that produces the maximum number of primes for consecutive values of $n$,
;;; starting with $n = 0$.

(import (ice-9 poe)
        (srfi :1)
        (srfi :41))

(define (prime? x)
  (and (> x 1)
       (let loop ((divisor 2))
         (or (< x (expt divisor 2))
           (and (not (zero? (modulo x divisor)))
             (loop (1+ divisor)))))))

(define prime?
  (pure-funcq prime?))

(define (arg-max pred lst)
  (car (fold-right (lambda (value arg-and-max)
                     (let ((max (cdr arg-and-max))
                           (result (pred value)))
                       (if (> max result)
                         arg-and-max
                         (cons value result))))
                   '(0 . 0)
                   lst)))

(define (cartesian-product . lists)
  (fold-right (lambda (xs ys)
                (append-map (lambda (x)
                              (map (lambda (y)
                                     (cons x y))
                                   ys))
                            xs))
              '(())
              lists))

(define (sieve lst)
  (let loop ((head (car lst))
             (tail (cdr lst))
             (result '()))
    (if (< (last tail) (expt head 2))
      (append (reverse result)
              (cons head tail))
      (loop (car tail)
            (remove (lambda (x)
                      (zero? (modulo x head)))
                    (cdr tail))
            (cons head result)))))

(define (primes-to x)
  (sieve (iota (1- x) 2)))

(define (prime-producer a b)
  (lambda (n)
    (+ b
       (expt n 2)
       (* a n))))

(define (prime-producer-length a b)
  (stream-length (stream-take-while (compose prime?
                                             (prime-producer a b))
                                    (stream-from 0))))

(display
  (apply *
         (arg-max (lambda (a-and-b)
                    (apply prime-producer-length a-and-b))
                  (cartesian-product (iota 999 -999 2)
                                     (primes-to 1000)))))
(newline)
