;;; We shall say that an n-digit number is pandigital if it makes use of all the
;;; digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
;;; also prime.
;;; 
;;; What is the largest n-digit pandigital prime that exists?

(define (insert l n e)
  (if (zero? n)
      (cons e l)
      (cons (car l) 
            (insert (cdr l) (1- n) e))))

(define (permute l)
  (if (null? l)
      '(())
      (apply append (map (lambda (p)
                           (map (lambda (n)
                                  (insert p n (car l)))
                                (iota (1+ (length p)))))
                         (permute (cdr l))))))

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
