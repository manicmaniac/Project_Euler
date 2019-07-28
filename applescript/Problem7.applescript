(*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 *
 * What is the 10 001st prime number?
 *)

on isPrime(x)
    if x = 2 then return true
    if x < 2 or x mod 2 = 0 then return false
    repeat with i from 3 to x ^ 0.5 by 2
        if x mod i = 0 then return false
    end repeat
    return true
end isPrime

set i to 0
set countOfPrimes to 0
repeat until countOfPrimes >= 10001
    set i to i + 1
    if isPrime(i) then set countOfPrimes to countOfPrimes + 1
end repeat
log i
