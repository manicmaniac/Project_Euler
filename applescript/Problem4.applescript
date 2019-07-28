(*
 * A palindromic number reads the same both ways. The largest palindrome made from
 * the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 *)

on isPalindrome(x as string)
    set digits to characters of x
    return digits = reverse of digits
end isPalindrome

on isProductOf3DigitsNumbers(x)
    repeat with i from 100 to x ^ 0.5
        set remainder to x mod i
        if remainder = 0 then
            set quotient to x / i
            if quotient < 1000 then
                return true
            end if
        end if
    end repeat
    return false
end isProductOf3DigitsNumbers

repeat with i from 998001 to 10000 by -1
    if isPalindrome(i) and isProductOf3DigitsNumbers(i) then
        log i
        exit repeat
    end if
end repeat
