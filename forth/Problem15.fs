\ Starting in the top left corner of a 2×2 grid, there are 6 routes (without
\ backtracking) to the bottom right corner.
\
\ [p_015]
\
\ How many routes are there through a 20×20 grid?

: ncr ( n1 n2 -- f3 )
  1e0
  1+ swap 1+ swap tuck ( n1 n2 -- n2+1 n1+1 n2+1 )
  do
    i s>f f*
  loop
  1 do
    i s>f f/
  loop ;

40 20 ncr f>s .
