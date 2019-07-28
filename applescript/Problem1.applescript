(*
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
 *)

set sum to 0
repeat with i from 1 to 999
    if i mod 3 = 0 or i mod 5 = 0 then set sum to sum + i
end repeat
log sum
