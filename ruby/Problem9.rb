# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

for m in 1..22
    for n in 1..m
        a, b, c = m ** 2 - n ** 2, 2 * m * n, m ** 2 + n **2
        if a + b + c == 1000
            puts a * b * c
        end
    end
end
