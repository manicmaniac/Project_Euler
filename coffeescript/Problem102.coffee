###
Three distinct points are plotted at random on a Cartesian plane, for which
-1000 ≤ x, y ≤ 1000, such that a triangle is formed.

Consider the following two triangles:

A(-340,495), B(-153,-910), C(835,-947)

X(-175,41), Y(-421,-714), Z(574,-645)

It can be verified that triangle ABC contains the origin, whereas triangle XYZ
does not.

Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file
containing the co-ordinates of one thousand "random" triangles, find the number
of triangles for which the interior contains the origin.

NOTE: The first two examples in the file represent the triangles in the example
given above.
###

fs = require('fs')
_ = require('underscore')

FILE = './triangles.txt'

class Vector
	constructor: (@x, @y) ->
	@crossProduct: (a, b) -> a.x * b.y - a.y * b.x

containsOrigin = (v1, v2, v3) ->
	cp = Vector.crossProduct
	res = [cp(v1, v2), cp(v2, v3), cp(v3, v1)]
	res.every((x) -> x > 0) or res.every((x) -> x < 0)

fs.readFile FILE, 'ascii', (err, data) ->
	throw err if err
	lines = data.split('\n').map((x) -> x.split(',').map(Number))
	console.log _(lines.map (line) ->
		v1 = new Vector(line[0], line[1])
		v2 = new Vector(line[2], line[3])
		v3 = new Vector(line[4], line[5])
		containsOrigin(v1, v2, v3)).compact().length

