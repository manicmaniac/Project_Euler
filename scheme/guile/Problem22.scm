;;; Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
;;;
;;; For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.
;;;
;;; What is the total of all the name scores in the file?

(import (ice-9 rdelim))

(define (parse-names port)
  (sort (map (lambda (entry)
               (string-filter char-alphabetic? entry))
             (string-split (read-line port) #\,))
        string<?))

(define (name-score name index)
  (* (1+ index)
     (- (apply +
               (map char->integer
                    (string->list name)))
        (* 64
           (string-length name)))))

(display
  (let loop ((i 0)
             (sum 0)
             (names (call-with-input-file "../../resources/names.txt" parse-names)))
    (if (null? names)
        sum
        (loop (1+ i)
              (+ sum (name-score (car names) i))
              (cdr names)))))
(newline)
