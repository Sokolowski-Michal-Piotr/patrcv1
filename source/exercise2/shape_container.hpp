#ifndef SHAPE_CONTAINER_HPP
#define SHAPE_CONTAINER_HPP

class shape;

class shape_container
{
public:
    shape_container();
    ~shape_container();

    shape_container(const shape_container& other) = delete;
    shape_container(shape_container&& other) = delete;

    shape_container& operator=(const shape_container& other) = delete;
    shape_container& operator=(shape_container&& other) = delete;

    shape** begin();
    shape** end();

    void add(shape *item);

    float total_area();

private:
    size_t size;
    size_t capacity;

    shape **shapes;
};

#endif // SHAPE_CONTAINER_HPP