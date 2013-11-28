#!/bin/bash
:<<'###'
Let d(n) be defined as the sum of proper divisors of n (numbers less than n
which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
###

function d_sum() {
    local {n=$1,res=1}
    if [ $n -le 1 ]; then
        echo 1
    else
        for i in `seq 2 $(($n - 1))`
        do
            if [ $(($n % $i)) -eq 0 ]; then
                let res+=$i
            fi
        done
        echo $res
    fi
}

function has_amicable() {
    local {n=$1,s,res}
    s=`d_sum $n`
    if [ $s -ne $n ] && [ `d_sum $s` -eq $n ]; then
        return 0
    else
        return 1
    fi
}

ans=0
for i in {1..10000}
do
    if `has_amicable $i`; then
        let ans+=$i
    fi
done

echo $ans

