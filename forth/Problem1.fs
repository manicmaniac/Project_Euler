\ If we list all the natural numbers below 10 that are multiples of 3 or 5, we
\ get 3, 5, 6 and 9. The sum of these multiples is 23.
\ 
\ Find the sum of all the multiples of 3 or 5 below 1000.

:noname ( -- answer )
  0 1000 0 do
    I 3 mod
    I 5 mod
    * 0= if
      I +
    then
  loop ;
execute .
