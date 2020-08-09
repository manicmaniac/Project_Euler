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

(define (amicables limit)
  (let ((numbers (make-vector limit 0)))
    (do ((i 1 (1+ i)))
      ((>= i limit))
      (do ((j (* i 2) (+ i j)))
        ((>= j limit))
        (vector-set! numbers j (+ i (vector-ref numbers j)))))
    (let loop ((i 0))
      (if (>= i limit)
          '()
          (let ((j (vector-ref numbers i)))
            (if (and (< j limit)
                     (= i (vector-ref numbers j))
                     (not (= i j)))
                (cons i (loop (1+ i)))
                (loop (1+ i))))))))

(display
  (apply + (amicables 10000)))
(newline)
