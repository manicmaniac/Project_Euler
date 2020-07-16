;;; Comparing two numbers written in index form like 2^11 and 3^7 is not difficult,
;;; as any calculator would confirm that 2^11 = 2048 < 3^7 = 2187.
;;;
;;; However, confirming that 632382^518061 > 519432^525806 would be much more
;;; difficult, as both numbers contain over three million digits.
;;;
;;; Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file
;;; containing one thousand lines with a base/exponent pair on each line, determine
;;; which line number has the greatest numerical value.
;;;
;;; NOTE: The first two lines in the file represent the numbers in the example
;;; given above.

(import (ice-9 rdelim))

(define (parse-csv port)
  (let ((line (read-line port)))
    (if (eof-object? line)
        '(())
        (cons (map (lambda (entry)
                     (string-trim-both entry #\"))
                   (string-split line #\,))
              (parse-csv port)))))

(display
  (let loop ((rows (call-with-input-file "../../resources/base_exp.txt" parse-csv))
             (line-number 1)
             (max-line-number-and-value '(0 . 0)))
    (if (null? (car rows))
        (car max-line-number-and-value)
        (let* ((base (string->number (caar rows)))
               (exponent (string->number (cadar rows)))
               (value (* exponent (log base))))
          (loop (cdr rows)
                (1+ line-number)
                (if (< value (cdr max-line-number-and-value))
                    max-line-number-and-value
                    (cons line-number value)))))))
(newline)
