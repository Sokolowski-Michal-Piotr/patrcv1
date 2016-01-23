#include "shape_container.hpp"

#include "shape.hpp"

shape_container::shape_container()
    : size(0)
    , capacity(0)
    , shapes(nullptr)
{

}

shape_container::~shape_container()
{
    for (auto &s : *this)
        delete s;
    delete[] shapes;
}

shape** shape_container::begin()
{
    return shapes;
}

shape** shape_container::end()
{
    return shapes + size;
}

void shape_container::add(shape *item)
{
    if (capacity == size)
    {
        shape **tmp = shapes;
        capacity <<= 2;
        shapes = new shape * [++capacity];
        for (size_t i = 0; i < size; i++)
            shapes[i] = tmp[i];
        delete[] tmp;
    }

    shapes[size++] = item;
}

float shape_container::total_area()
{
    float total = 0.0f;

    auto it  = begin(),
         end = this->end();
    while (it != end)
        total += (*it++)->area();

    return total;
}
