#include <cstdlib>
#include <iostream>

#include "square.hpp"
#include "triangle.hpp"
#include "rectangle.hpp"

int main(int argc, char *argv[])
{
    square sqr{ 2.0f };
    triangle tri{ 1.0f, 3.0f };
    rectangle rect{ 2.0f, 3.0f };

    std::cout << "Square area: " << sqr.area() << "\n";
    std::cout << "Triangle area: " << tri.area() << "\n";
    std::cout << "Rectangle area: " << rect.area() << "\n";

    return EXIT_SUCCESS;
}