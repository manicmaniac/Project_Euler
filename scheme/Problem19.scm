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

(import (srfi :1)
        (srfi :19))

(define (sunday? date)
  (zero? (date-week-day date)))

(define (make-month year month)
  (make-date 0 0 0 0 1 month year 0 ))

(define years
  (iota 100 1901))

(define months
  (iota 12 1))

(display
  (length (filter sunday?
                  (map (lambda (arg)
                         (make-month (car arg) (cadr arg)))
                       (concatenate
                         (map (lambda (year)
                                (zip (make-list (length months) year)
                                     months))
                              years))))))
