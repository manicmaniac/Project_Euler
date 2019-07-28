(*
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 *
 * a^2 + b^2 = c^2
 *
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 *)

set m to 1
set n to 1
repeat until m * (m + n) = 500
    if m < n then
        set m to m + 1
        set n to 1
    end if
    set n to n + 1
end repeat
log ((m ^ 4 - n ^ 4) * 2 * m * n) as integer
