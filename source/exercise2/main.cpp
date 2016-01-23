#include <cstdlib>
#include <iostream>

#include "square.hpp"
#include "triangle.hpp"
#include "rectangle.hpp"
#include "shape_container.hpp"

int main(int argc, char *argv[])
{
    shape_container shapes;

    shapes.add(new square(3));
    shapes.add(new rectangle(2, 4));
    shapes.add(new triangle(2.5f, 5));

    for (auto s : shapes)
        std::cout << "Area: " << s->area() << "\n";

    std::cout << "Total area: " << shapes.total_area() << "\n";

    return EXIT_SUCCESS;
}