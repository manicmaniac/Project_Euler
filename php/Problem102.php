<?php
/*
 * Three distinct points are plotted at random on a Cartesian plane, for which
 * -1000 ≤ x, y ≤ 1000, such that a triangle is formed.
 *
 * Consider the following two triangles:
 *
 * A(-340,495), B(-153,-910), C(835,-947)
 *
 * X(-175,41), Y(-421,-714), Z(574,-645)
 *
 * It can be verified that triangle ABC contains the origin, whereas triangle XYZ
 * does not.
 *
 * Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file
 * containing the co-ordinates of one thousand "random" triangles, find the number
 * of triangles for which the interior contains the origin.
 *
 * NOTE: The first two examples in the file represent the triangles in the example
 * given above.
 */

class Vector2D {
    public $x;
    public $y;

    function __construct($x, $y) {
        $this->x = $x;
        $this->y = $y;
    }

    function crossProduct($that) {
        return $this->x * $that->y - $that->x * $this->y;
    }
}

function containsOrigin($a, $b, $c) {
    $p = $a->crossProduct($b);
    $q = $b->crossProduct($c);
    $r = $c->crossProduct($a);
    return ($p < 0 and $q < 0 and $r < 0) or ($p >= 0 and $q >= 0 and $r >= 0);
}

$count = 0;
$csv = new SplFileObject('../resources/triangles.txt');
$csv->setFlags(SplFileObject::READ_CSV);
foreach ($csv as $row) {
    if (count($row) == 6) {
        list($ax, $ay, $bx, $by, $cx, $cy) = $row;
        $a = new Vector2D($ax, $ay);
        $b = new Vector2D($bx, $by);
        $c = new Vector2D($cx, $cy);
        if (containsOrigin($a, $b, $c)) {
            $count++;
        }
    }
}
echo $count;
