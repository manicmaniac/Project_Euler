#!/usr/bin/env tclsh

# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

proc lcg {n c x} {
    return [expr ($x * $x + $c) % $n]
}

proc tcl::mathfunc::gcd {x y} {
    return [expr $y ? gcd($y, $x % $y) : $x]
}

proc tcl::mathfunc::modexp {a b n} {
    if {$b == 0} {
        return 1
    }
    set c [expr {modexp($a, $b / 2, $n) ** 2 % $n}]
    if {$b & 1} {
        set c [expr {($c * $a) % $n}]
    }
    return $c
}

proc tcl::mathfunc::randrange {begin end} {
    return [expr round($begin + rand() * ($end - $begin))]
}

proc is_prime {n {accuracy 20}} {
    set n [expr abs($n)]
    if {$n == 2} {
        return true
    }
    if {$n == 1 || !($n & 1)} {
        return false
    }
    set d [expr $n - 1]
    while {!($d & 1)} {
        set d [expr $d >> 1]
    }
    for {set i 0} {$i < $accuracy} {incr i} {
        set a [expr randrange(1, $n - 1)]
        set t $d
        set y [expr modexp($a, $t, $n)]
        while {$t != [expr $n - 1] && $y != 1 && $y != [expr $n - 1]} {
            set y [expr ($y * $y) % $n]
            set t [expr $t << 1]
        }
        if {$y != [expr $n - 1] && !($t & 1)} {
            return false
        }
    }
    return true
}

proc trial_division {n} {
    set limit [expr floor(sqrt($n) + 1)]
    for {set i 2} {$i < $limit} {incr i} {
        if {!($n % $i)} {
            return $i
        }
    }
    return -1
}

proc pollards_rho {n {c 1}} {
    set x 2
    set y 2
    set d 1
    while {$d == 1 && $n} {
        set x [lcg $n $c $x]
        set y [lcg $n $c [lcg $n $c $y]]
        set d [expr gcd($x - $y, $n)]
        if {$d == $n} {
            return -1
        }
    }
    return $d
}

proc factor {n {accuracy 10}} {
    if {[is_prime $n]} {
        return $n
    }
    if {$n < 100} {
        set divisor [trial_division $n]
    } else {
        set divisor [pollards_rho $n $accuracy]
    }
    if {$divisor == -1} {
        if {$accuracy} {
            return [factor $n [expr $accuracy - 1]]
        }
        return $n
    }
    return [concat [factor [expr $n / $divisor]] [factor $divisor]]
}

proc lmax {l} {
    set max [lindex $l 0]
    foreach x $l {
        if {$max < $x} {
            set max $x
        }
    }
    return $max
}

puts [lmax [factor 600851475143]]

