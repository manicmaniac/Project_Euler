;;; You are given the following information, but you may prefer to do some research
;;; for yourself.
;;;
;;;   • 1 Jan 1900 was a Monday.
;;;   • Thirty days has September,
;;;     April, June and November.
;;;     All the rest have thirty-one,
;;;     Saving February alone,
;;;     Which has twenty-eight, rain or shine.
;;;     And on leap years, twenty-nine.
;;;   • A leap year occurs on any year evenly divisible by 4, but not on a century
;;;     unless it is divisible by 400.
;;;
;;; How many Sundays fell on the first of the month during the twentieth century (1
;;; Jan 1901 to 31 Dec 2000)?

(import (ice-9 receive)
        (srfi :1)
        (srfi :19))

(define (cartesian-product . lists)
  (fold-right (lambda (xs ys)
                (append-map (lambda (x)
                              (map (lambda (y)
                                     (cons x y))
                                   ys))
                            xs))
              '(())
              lists))

(display
  (receive (years months)
           (unzip2 (cartesian-product (iota 100 1901)
                                      (iota 12 1)))
           (count (lambda (year month)
                    (zero? (date-week-day (make-date 0 0 0 0 1 month year 0))))
                  years
                  months)))
