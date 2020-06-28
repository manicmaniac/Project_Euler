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

#include <array>
#include <complex>
#include <fstream>
#include <iostream>
#include <sstream>

class Triangle final {
    std::complex<double> a;
    std::complex<double> b;
    std::complex<double> c;

public:
    Triangle(std::complex<double>& a_, std::complex<double>& b_, std::complex<double>& c_): a(a_), b(b_), c(c_) {};
    bool contains_origin() {
        bool p = std::signbit((std::conj(a) * b).imag());
        bool q = std::signbit((std::conj(b) * c).imag());
        bool r = std::signbit((std::conj(c) * a).imag());
        return p == q && q == r;
    }
};

int main() {
    std::ifstream file("../resources/triangles.txt");
    if (!file) {
        std::cerr << strerror(errno) << std::endl;
        return EXIT_FAILURE;
    }
    int count = 0;
    while (!file.eof()) {
        std::string line;
        file >> line;
        std::istringstream tokenizer(line);
        std::string token;
        std::array<double, 6> numbers;
        for (size_t i = 0; i < numbers.size(); ++i) {
            std::getline(tokenizer, token, ',');
            if (!token.empty()) {
                numbers[i] = std::stod(token);
            }
        }
        std::complex<double> a(numbers[0], numbers[1]);
        std::complex<double> b(numbers[2], numbers[3]);
        std::complex<double> c(numbers[4], numbers[5]);
        if (Triangle(a, b, c).contains_origin()) {
            ++count;
        }
    }
    file.close();
    std::cout << count << std::endl;
}
