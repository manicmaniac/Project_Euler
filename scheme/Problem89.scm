;;; For a number written in Roman numerals to be considered valid there are basic
;;; rules which must be followed. Even though the rules allow some numbers to be
;;; expressed in more than one way there is always a "best" way of writing a
;;; particular number.
;;;
;;; For example, it would appear that there are at least six ways of writing the
;;; number sixteen:
;;;
;;; IIIIIIIIIIIIIIII
;;; VIIIIIIIIIII
;;; VVIIIIII
;;; XIIIIII
;;; VVVI
;;; XVI
;;;
;;; However, according to the rules only XIIIIII and XVI are valid, and the last
;;; example is considered to be the most efficient, as it uses the least number of
;;; numerals.
;;;
;;; The 11K text file, roman.txt (right click and 'Save Link/Target As...'),
;;; contains one thousand numbers written in valid, but not necessarily minimal,
;;; Roman numerals; see About... Roman Numerals for the definitive rules for this
;;; problem.
;;;
;;; Find the number of characters saved by writing each of these in their minimal
;;; form.
;;;
;;; Note: You can assume that all the Roman numerals in the file contain no more
;;; than four consecutive identical units.

(import (ice-9 match)
        (ice-9 rdelim)
        (srfi :1))

(define (number->roman x)
  (let loop ((x x)
             (result ""))
    (cond ((zero? x) result)
          ((<= 1000 x) (loop (- x 1000) (string-append result  "M")))
          ((<=  900 x) (loop (- x  900) (string-append result "CM")))
          ((<=  500 x) (loop (- x  500) (string-append result  "D")))
          ((<=  400 x) (loop (- x  400) (string-append result "CD")))
          ((<=  100 x) (loop (- x  100) (string-append result  "C")))
          ((<=   90 x) (loop (- x   90) (string-append result "XC")))
          ((<=   50 x) (loop (- x   50) (string-append result  "L")))
          ((<=   40 x) (loop (- x   40) (string-append result "XL")))
          ((<=   10 x) (loop (- x   10) (string-append result  "X")))
          ((<=    9 x) (loop (- x    9) (string-append result "IX")))
          ((<=    5 x) (loop (- x    5) (string-append result  "V")))
          ((<=    4 x) (loop (- x    4) (string-append result "IV")))
          ((<=    1 x) (loop (- x    1) (string-append result  "I"))))))

(define (roman->number str)
  (let loop ((chars (string->list str))
             (result 0))
    (match chars
           ((#\C #\M . tail) (loop tail (+ result  900)))
           ((#\M     . tail) (loop tail (+ result 1000)))
           ((#\C #\D . tail) (loop tail (+ result  400)))
           ((#\D     . tail) (loop tail (+ result  500)))
           ((#\X #\C . tail) (loop tail (+ result   90)))
           ((#\C     . tail) (loop tail (+ result  100)))
           ((#\X #\L . tail) (loop tail (+ result   40)))
           ((#\L     . tail) (loop tail (+ result   50)))
           ((#\I #\X . tail) (loop tail (+ result    9)))
           ((#\X     . tail) (loop tail (+ result   10)))
           ((#\I #\V . tail) (loop tail (+ result    4)))
           ((#\V     . tail) (loop tail (+ result    5)))
           ((#\I     . tail) (loop tail (+ result    1)))
           (_ result))))

(define (roman-shorten str)
  (number->roman
    (roman->number str)))

(define filename
  "../resources/roman.txt")

(with-input-from-file filename (lambda ()
                                 (display
                                   (fold (lambda (str difference)
                                           (+ difference
                                              (- (string-length str)
                                                 (string-length (roman-shorten str)))))
                                         0
                                         (let loop ((line (read-line))
                                                    (lines '()))
                                           (if (eof-object? line)
                                             lines
                                             (loop (read-line) (append lines
                                                                       (list line)))))))))
