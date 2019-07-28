(*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
 *)

on factorize(x)
    set divisor to 2
    set factorized to {}

    repeat while x >= divisor
        set remainder to x mod divisor
        if remainder = 0 then
            set end of factorized to divisor
            set x to x / divisor
        else
            set divisor to divisor + 1
        end if
    end repeat
    return factorized
end factorize

log last item of factorize(600851475143)
