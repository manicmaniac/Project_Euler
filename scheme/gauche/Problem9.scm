;;; A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
;;; 
;;; a^2 + b^2 = c^2
;;; 
;;; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
;;; 
;;; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
;;; Find the product abc.

(define (pythagorean-triplet x y)
  (values (- (expt x 2) (expt y 2))
          (* 2 x y)
          (+ (expt x 2) (expt y 2))))

(print (let loop ((x 0)
                  (y 0))
         (receive (a b c)
                  (pythagorean-triplet x y)
                  (cond ((= (+ a b c) 1000) (* a b c))
                        ((= x y) (loop (+ 1 x) 0))
                        (else (loop x (+ 1 y)))))))
