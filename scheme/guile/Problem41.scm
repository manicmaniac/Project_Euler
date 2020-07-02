;;; We shall say that an n-digit number is pandigital if it makes use of all the
;;; digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
;;; also prime.
;;; 
;;; What is the largest n-digit pandigital prime that exists?

(define (permute l)
  (let loop ((l l)
             (tail '()))
    (if (null? l)
        (list tail)
        (apply append (map (lambda (x)
                             (loop (delq x l)
                                   (cons x tail)))
                           l)))))

(define (prime? x)
  (cond ((< x 2) #f)
        ((even? x) (= x 2))
        (else (let loop ((sqrt-x (exact-integer-sqrt x))
                    (i 3))
                (cond ((> i sqrt-x) #t)
                      ((zero? (modulo x i)) #f)
                      (else (loop sqrt-x (+ i 2))))))))

(define (digits->integer digits)
  (let loop ((digits digits)
             (result 0))
  (if (null? digits)
      result
      (loop (cdr digits)
            (+ (* result 10)
               (car digits))))))

(display
  (apply max
         (filter prime?
                 (map (lambda (xs)
                        (digits->integer (cons 7 xs)))
                      (permute '(1 2 3 4 5 6))))))
(newline)
