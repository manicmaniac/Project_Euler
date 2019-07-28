(*
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*)

on gcd(x, y)
    if y = 0 then
        return x
    end if
    return gcd(y, x mod y)
end gcd

on lcm(x, y)
    return x * y / gcd(x, y)
end lcm

set product to 1
repeat with i from 1 to 20
    set product to lcm(product, i)
end repeat
log product as integer
