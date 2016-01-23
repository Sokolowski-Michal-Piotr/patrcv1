#ifndef SHAPE_HPP
#define SHAPE_HPP

class shape
{
public:
    shape(float a, float b);
    virtual ~shape() = default;
    
    virtual float area() = 0;

protected:
    float a, b;
};

#endif // SHAPE_HPP
