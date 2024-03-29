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

require 'csv'
require 'matrix'

answer = CSV.read('../resources/triangles.txt', converters: :numeric).count do |row|
  v1, v2, v3 = row.each_slice(2).map { |a, b| Vector[0, a, b] }
  a = v1.cross(v2).first.positive?
  b = v2.cross(v3).first.positive?
  c = v3.cross(v1).first.positive?
  a == b && b == c
end
puts answer
