;;; A palindromic number reads the same both ways. The largest palindrome made from
;;; the product of two 2-digit numbers is 9009 = 91 × 99.
;;; 
;;; Find the largest palindrome made from the product of two 3-digit numbers.

(use gauche.lazy)

(define (count-digits x)
  (+ 1 (floor->exact (log x 10))))

(define (reverse-digits x)
  (let loop ((original x)
             (reversed 0))
    (if (zero? original)
      reversed
      (receive (q r)
               (quotient&remainder original 10)
               (loop q (+ (* reversed 10) r))))))

(define (make-palindrome x)
  (+ (* x (expt 10 (count-digits x))) (reverse-digits x)))

(define (composite-of-3digits-numbers? x)
  (let loop ((i 1))
    (receive (q r)
             (quotient&remainder x i)
             (cond ((>= i (sqrt x)) #f)
                   ((and (< q 1000) (zero? r)) #t)
                   (else (loop (+ i 1)))))))

(print (find composite-of-3digits-numbers? (lmap make-palindrome (liota 900 999 -1))))
