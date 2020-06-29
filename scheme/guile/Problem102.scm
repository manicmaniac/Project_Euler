;;; Three distinct points are plotted at random on a Cartesian plane, for which
;;; -1000 ≤ x, y ≤ 1000, such that a triangle is formed.
;;; 
;;; Consider the following two triangles:
;;; 
;;; A(-340,495), B(-153,-910), C(835,-947)
;;; 
;;; X(-175,41), Y(-421,-714), Z(574,-645)
;;; 
;;; It can be verified that triangle ABC contains the origin, whereas triangle XYZ
;;; does not.
;;; 
;;; Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file
;;; containing the co-ordinates of one thousand "random" triangles, find the number
;;; of triangles for which the interior contains the origin.
;;; 
;;; NOTE: The first two examples in the file represent the triangles in the example
;;; given above.

(import (ice-9 rdelim)
        (srfi :1))

(define (conjugate a)
  (- (real-part a) (imag-part a)))

(define (cross-product a b)
  (imag-part (* (conjugate a) b)))

(define (contains-origin a b c)
  (eqv? (positive? (cross-product a b))
        (positive? (cross-product b c))
        (positive? (cross-product c a))))

(define (parse-csv port)
  (let ((line (read-line port)))
    (if (eof-object? line)
        '()
        (cons (string-split line #\,) (parse-csv port)))))

(display (count (lambda (row)
                  (let ((row (map string->number row)))
                    (contains-origin (make-rectangular (list-ref row 0)
                                                       (list-ref row 1))
                                     (make-rectangular (list-ref row 2)
                                                       (list-ref row 3))
                                     (make-rectangular (list-ref row 4)
                                                       (list-ref row 5)))))
                (call-with-input-file "../../resources/triangles.txt" parse-csv)))
