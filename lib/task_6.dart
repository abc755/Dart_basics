import 'dart:math';
//Задание 6
class Point {
  final double x;
  final double y;
  final double z;

  Point(this.x, this.y, this.z);

  Point.zero()
      : x = 0,
        y = 0,
        z = 0;

  Point.one()
      : x = 1,
        y = 1,
        z = 1;

  double distanceTo(Point another) {
    // с использованием dart.math
    final distance = sqrt(pow((another.x - this.x), 2) +
        pow((another.y - this.y), 2) +
        pow((another.z - this.z), 2));
    return distance;
  }
  String info() {
    return 'Координаты точки: x=${this.x}, y=${this.y}, z=${this.z}';
  }
}
void main() {
  print('\nЗадание 6');
  var firstPoint = Point(5, 10, 15);
  var secondPoint = Point(20, 30, 40);
  var distance = firstPoint.distanceTo(secondPoint);
  print(firstPoint.info());
  print(secondPoint.info());
  print('Дистанция между точками: ${distance}');
}