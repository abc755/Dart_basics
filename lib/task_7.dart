//Задание 7
extension on num {
  num mabs(num x) {
    return (x < 0) ? -x : x;
  }

  num? calculateSqrt(rootDegree) {
    try {
      if (rootDegree == 0) {
        throw Exception('Задайте параметр степени, отличный от нуля');
      }
      num eps = 0.0000001; //погрешность
      num root = this / rootDegree;
      num rn = this;
      int i;

      while (this.mabs(root - rn) >= eps) {
        rn = this;
        for (i = 1; i < rootDegree; i++) {
          rn = rn / root;
        }
        root = rn / rootDegree + root * (1.0 - 1.0 / rootDegree);
        i++;
      }
      if (root.isInfinite)
        throw Exception('Не удалось выполнить расчет, уменьшите параметы');
      return root;
    } catch (e) {
      print(e);
    }
  }
}
void main() {
  print('\nЗадание 7');
  print('Корень 3 степени из числа 1728 = ${1728.calculateSqrt(3)}');
  // print(500.calculateSqrt(1700)); //выдает Infinity, нужно уточнить почему и что с этим делать
}