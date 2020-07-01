;;; An irrational decimal fraction is created by concatenating the positive
;;; integers:
;;;
;;; 0.123456789101112131415161718192021...
;;;
;;; It can be seen that the 12^th digit of the fractional part is 1.
;;;
;;; If d[n] represents the n^th digit of the fractional part, find the value of the
;;; following expression.
;;;
;;; d[1] × d[10] × d[100] × d[1000] × d[10000] × d[100000] × d[1000000]

(define (digits-length x)
  (let loop ((x x)
             (len 0))
    (if (zero? x)
        (max 1 len)
        (loop (floor/ x 10)
              (1+ len)))))

(define (digit-at x n)
  (modulo (floor/ x
                  (expt 10
                        (- (digits-length x) 1 n)))
          10))

(define (champernowne-at n)
  (let loop ((n (1- n))
             (i 1))
    (let ((ndigits (digits-length i)))
      (if (< n ndigits)
          (digit-at i n)
          (loop (- n ndigits)
                (1+ i))))))

(display
  (* (champernowne-at 1)
     (champernowne-at 10)
     (champernowne-at 100)
     (champernowne-at 1000)
     (champernowne-at 10000)
     (champernowne-at 100000)
     (champernowne-at 1000000)))
(newline)
