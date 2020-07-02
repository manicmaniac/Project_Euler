;;; A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
;;;
;;; a^2 + b^2 = c^2
;;;
;;; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
;;;
;;; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;;; Find the product abc.

(define (make-pythagorean-triplet x y)
  (let ((x^2 (* x x))
        (y^2 (* y y)))
    (values (- x^2 y^2)
            (* 2 x y)
            (+ x^2 y^2))))

(display
  (let loop ((x 1)
             (y 1))
    (call-with-values (lambda ()
                        (make-pythagorean-triplet x y))
                      (lambda (a b c)
                        (cond ((= 1000 (+ a b c)) (* a b c))
                              ((> x y) (loop x (1+ y)))
                              (else (loop (1+ x) 1)))))))
(newline)
