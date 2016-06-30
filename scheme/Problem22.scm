; Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
;
; For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938  53 = 49714.
;
; What is the total of all the name scores in the file?

(use-modules (ice-9 iconv)
             (ice-9 rdelim)
             (rnrs bytevectors)
             (srfi srfi-1)
             (srfi srfi-26))

(define (name-score name)
  (apply +
         (map (cut - <> 64)
              (bytevector->u8-list (string->bytevector name "ascii")))))

(define (parse-csv-line line)
  (map name-score
    (sort (string-split
            (string-delete (cut eqv? <> #\") line)
            #\,)
          string<?)))

(define (zip-index xs)
  (zip xs (iota (length xs) 1)))

(define filename "../resources/names.txt")

(with-input-from-file filename (lambda ()
                                 (display
                                   (apply +
                                      (map (cut apply * <>)
                                           (zip-index (parse-csv-line (read-line))))))
                                 (newline)))
