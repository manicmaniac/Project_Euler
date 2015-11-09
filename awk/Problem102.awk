#!/usr/bin/env awk
# Three distinct points are plotted at random on a Cartesian plane, for which
# -1000 ≤ x, y ≤ 1000, such that a triangle is formed.
#
# Consider the following two triangles:
#
# A(-340,495), B(-153,-910), C(835,-947)
#
# X(-175,41), Y(-421,-714), Z(574,-645)
#
# It can be verified that triangle ABC contains the origin, whereas triangle XYZ
# does not.
#
# Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file
# containing the co-ordinates of one thousand "random" triangles, find the number
# of triangles for which the interior contains the origin.
#
# NOTE: The first two examples in the file represent the triangles in the example
# given above.

function cross_product(ax, ay, bx, by) {
    return ax * by - bx * ay;
}

function contains_origin(ax, ay, bx, by, cx, cy,    p, q, r) {
    p = cross_product(ax, ay, bx, by)
    q = cross_product(bx, by, cx, cy)
    r = cross_product(cx, cy, ax, ay)
    return (p < 0 && q < 0 && r < 0) || (p >= 0 && q >= 0 && r >= 0)
}

BEGIN {
    count = 0
}

/-?[0-9]+,-?[0-9]+,-?[0-9]+,-?[0-9]+,-?[0-9]+,-?[0-9]+/ {
    split($0, row, ",")
    ax = row[1]
    ay = row[2]
    bx = row[3]
    by = row[4]
    cx = row[5]
    cy = row[6]
    if (contains_origin(ax, ay, bx, by, cx, cy)) {
        count++
    }
}

END {
    print count
}
