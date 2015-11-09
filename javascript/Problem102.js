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

var assert = require('assert');
var fs = require('fs');

function Vector2D(x, y) {
  function Vector2D(x, y) {
    this.x = parseInt(x);
    this.y = parseInt(y);
  }
  Vector2D.prototype.crossProduct = function(that) {
    return this.x * that.y - that.x * this.y;
  };
  return new Vector2D(x, y);
}

function containsOrigin(a, b, c) {
  var p = a.crossProduct(b);
  var q = b.crossProduct(c);
  var r = c.crossProduct(a);
  return (p < 0 && q < 0 && r < 0) || (p >= 0 && q >= 0 && r >= 0);
}

fs.readFile('../resources/triangles.txt', 'ascii', function(err, data) {
  assert.ifError(err);
  var count = 0;
  data.split('\n').forEach(function(row) {
    var columns = row.split(',');
    var a = Vector2D.apply(Vector2D, columns.slice(0, 2));
    var b = Vector2D.apply(Vector2D, columns.slice(2, 4));
    var c = Vector2D.apply(Vector2D, columns.slice(4, 6));
    if (containsOrigin(a, b, c)) {
      count++;
    }
  });
  console.log(count);
});
