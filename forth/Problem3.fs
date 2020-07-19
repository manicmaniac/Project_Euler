\ The prime factors of 13195 are 5, 7, 13 and 29.
\ 
\ What is the largest prime factor of the number 600851475143 ?

: max-factor ( x -- biggest factor of x )
  2
  begin
    2dup /mod swap
    if
      drop
      1+
    else
      rot drop swap
    then
    2dup <
  until
  nip ;


600851475143 max-factor .
