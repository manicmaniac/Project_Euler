(*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * 
 * Find the sum of all the primes below two million.
 *)

on sieve out of composites to limit
    set the first item of composites to true
    repeat with i from 2 to limit ^ 0.5
        if not item i of composites then
            repeat with j from i ^ 2 to limit by i
                set item j of composites to true
            end repeat
        end if
    end repeat
end sieve

set limit to 2000000
set composites to {}
repeat limit times
   set end of composites to false
end repeat

sieve out of a reference to composites to limit

set sum to 0
repeat with i from 1 to limit
    if not item i of composites then
        set sum to sum + i
    end if
end repeat

log sum
