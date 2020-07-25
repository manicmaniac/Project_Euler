\ 2520 is the smallest number that can be divided by each of the numbers from 1
\ to 10 without any remainder.
\
\ What is the smallest positive number that is evenly divisible by all of the
\ numbers from 1 to 20?

: gcd ( n1 n2 -- n3 )
  dup if
    tuck mod recurse
  else
    drop
  then ;

: lcm ( n1 n2 -- n3 )
  2dup * -rot gcd / ;

:noname ( -- n )
  1
  21 1 do
    i lcm
  loop ;
execute .
