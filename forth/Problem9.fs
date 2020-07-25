\ A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
\
\ a^2 + b^2 = c^2
\
\ For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
\
\ There exists exactly one Pythagorean triplet for which a + b + c = 1000.
\ Find the product abc.

:noname ( -- n )
  1 1
  begin
    2dup < if
      drop 1+ 1
    then
    1+
    2dup swap tuck + * 500 =
  until ;
execute
2dup
dup * dup * swap ( n -- n^4 )
dup * dup * swap ( n -- n^4 )
- * * 2* .
