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

const { readFileSync } = require('fs')

class Vector2D {
  constructor(x, y) {
    this.x = x
    this.y = y
  }

  crossProduct(that) {
    return this.x * that.y - that.x * this.y
  }
}

function containsOrigin(a, b, c) {
  const p = a.crossProduct(b)
  const q = b.crossProduct(c)
  const r = c.crossProduct(a)
  return (p < 0 && q < 0 && r < 0) || (p >= 0 && q >= 0 && r >= 0)
}

const triangles = readFileSync('../resources/triangles.txt', 'ascii')
  .split('\n')
  .map(xs => xs.split(',').map(Number))
const answer = triangles.filter(([a, b, c, d, e, f]) => {
  const p = new Vector2D(a, b)
  const q = new Vector2D(c, d)
  const r = new Vector2D(e, f)
  return containsOrigin(p, q, r)
}).length
console.log(answer)
