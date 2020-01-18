;;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
;;; 
;;; Find the sum of all the primes below two million.

(use math.prime)
(use srfi-1)

(print (apply + (take-while (pa$ > 2e6) *primes*)))
