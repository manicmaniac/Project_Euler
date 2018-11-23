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
package main

import (
	"encoding/csv"
	"fmt"
	"os"
	"strconv"
)

func CrossProduct(a complex128, b complex128) float64 {
	return real(a)*imag(b) - real(b)*imag(a)
}

func ContainsOrigin(a complex128, b complex128, c complex128) bool {
	p := CrossProduct(a, b)
	q := CrossProduct(b, c)
	r := CrossProduct(c, a)
	return (p < 0 && q < 0 && r < 0) || (p >= 0 && q >= 0 && r >= 0)
}

func main() {
	file, err := os.Open("../resources/triangles.txt")
	if err != nil {
		panic(err)
	}
	defer file.Close()
	reader := csv.NewReader(file)
	rows, err := reader.ReadAll()
	if err != nil {
		panic(err)
	}
	count := 0
	for _, row := range rows {
		ax, _ := strconv.ParseFloat(row[0], 64)
		ay, _ := strconv.ParseFloat(row[1], 64)
		bx, _ := strconv.ParseFloat(row[2], 64)
		by, _ := strconv.ParseFloat(row[3], 64)
		cx, _ := strconv.ParseFloat(row[4], 64)
		cy, _ := strconv.ParseFloat(row[5], 64)
		a := complex(ax, ay)
		b := complex(bx, by)
		c := complex(cx, cy)
		if ContainsOrigin(a, b, c) {
			count++
		}
	}
	fmt.Println(count)
}
