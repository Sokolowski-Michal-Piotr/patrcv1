#ifndef TRIANGLE_HPP
#define TRIANGLE_HPP

#include "shape.hpp"

class triangle : public shape
{
public:
    virtual float area() override;

    using shape::shape;
};

#endif // TRIANGLE_HPP
