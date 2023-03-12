class Shape{
  int getArea(){
    return getArea();
  }
  int getPerimeter(){
      return getPerimeter();
  }
}

class Circle implements Shape {

  int radius;

  Circle(this.radius);

  @override
  int getArea() {
    // TODO: implement getArea
    return (3.14*radius*radius).toInt(); 
  }

  @override
  int getPerimeter() {
    // TODO: implement getPerimeter
    return (2*3.14*radius).toInt();
  }

}

class Square implements Shape {

  int side;

  Square(this.side);

  @override
  int getArea() {
    // TODO: implement getArea
    return side * side;
  }

  @override
  int getPerimeter() {
    // TODO: implement getPerimeter
    return 4 * side;
  }

}

class Rectangle implements Shape {
  int width;
  int height;

  Rectangle(this.width,this.height);

  @override
  int getArea() {
    // TODO: implement getArea
    return width*height;
  }

  @override
  int getPerimeter() {
    // TODO: implement getPerimeter
    return 2 * (width + height);
  }

}

void main() {
  Shape shape = Circle(4);
  print('Luas Lingkaran');
  print(shape.getArea());
  print('Keliling Lingkaran');
  print(shape.getPerimeter());

  shape = Square(4);
  print('Luas Persegi');
  print(shape.getArea());
  print('Keliling Persegi');
  print(shape.getPerimeter());

  shape = Rectangle(8, 4);
  print('Luas Persegi Panjang');
  print(shape.getArea());
  print('Keliling Persegi Panjang');
  print(shape.getPerimeter());
}