;;; The number, 1406357289, is a 0 to 9 pandigital number because it is made up of
;;; each of the digits 0 to 9 in some order, but it also has a rather interesting
;;; sub-string divisibility property.
;;; 
;;; Let d[1] be the 1^st digit, d[2] be the 2^nd digit, and so on. In this way, we
;;; note the following:
;;; 
;;;   • d[2]d[3]d[4]=406 is divisible by 2
;;;   • d[3]d[4]d[5]=063 is divisible by 3
;;;   • d[4]d[5]d[6]=635 is divisible by 5
;;;   • d[5]d[6]d[7]=357 is divisible by 7
;;;   • d[6]d[7]d[8]=572 is divisible by 11
;;;   • d[7]d[8]d[9]=728 is divisible by 13
;;;   • d[8]d[9]d[10]=289 is divisible by 17
;;; 
;;; Find the sum of all 0 to 9 pandigital numbers with this property.

(import (srfi :1)
        (srfi :41))

(define (list-pandigital? xs)
  (lset= = xs (iota 10)))

(define (digits->number digits)
  (let loop ((digits digits)
             (number 0))
    (if (null? digits)
        number
        (loop (cdr digits)
              (+ (* 10 number) (car digits))))))

(define (divisible-by? d x)
  (zero? (modulo x d)))

(define-stream (candidates-stream)
               (stream-of (list d1 d2 d3 d4 d5 d6 d7 d8 d9 d10)
                          (d1 in (stream-range 1 10))
                          (d2 in (stream-range 0 10))
                          (d3 in (stream-range 0 10))
                          (d4 in (stream-range 0 10 2))
                          (d5 in (stream-range 0 10))
                          (zero? (modulo (+ d3 d4 d5) 3))
                          (d6 in (stream-range 0 10 5))
                          (d7 in (stream-range 0 10))
                          (zero? (modulo (digits->number (list d5 d6 d7)) 7))
                          (d8 in (stream-range 0 10))
                          (zero? (modulo (digits->number (list d6 d7 d8)) 11))
                          (d9 in (stream-range 0 10))
                          (zero? (modulo (digits->number (list d7 d8 d9)) 13))
                          (d10 in (stream-range 0 10))
                          (zero? (modulo (digits->number (list d8 d9 d10)) 17))))

(display 
  (apply +
         (map digits->number (stream->list (stream-filter list-pandigital?
                                                          (candidates-stream))))))
(newline)
