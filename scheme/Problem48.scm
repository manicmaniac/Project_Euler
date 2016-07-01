;;; The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
;;;
;;; Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

(use-modules (srfi srfi-1))

(display
  (remainder (apply +
                    (map (lambda (x) (expt x x))
                         (iota 999 1)))
             (expt 10 10)))
(newline)
