#ifndef RECTANGLE_HPP
#define RECTANGLE_HPP

#include "shape.hpp"

class rectangle : public shape
{
public:
    virtual float area() override;

    using shape::shape;
};

#endif // RECTANGLE_HPP
