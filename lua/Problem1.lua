#!/usr/bin/env lua
--[[
If we list all the natural numbers below 10 that are multiples of 3 or 5, we
get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
]]--

res = 0
for i = 0, 999, 1 do
    if i % 3 * i % 5 == 0 then
        res = res + i
    end
end
print(res)

