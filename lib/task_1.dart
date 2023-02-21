//  Задание 1
class DelimetersCalculator {
  // (1 часть)
  static int calculateNod(int a, int b) {
    if (a < 1 || b < 1) throw Exception('Расчет возможен только для натуральных чисел');
    int t;
    if (a < b) {
      t = a;
      a = b;
      b = t;
    }

    while (b != 0) {
      a %= b;
      t = a;
      a = b;
      b = t;
    }
    return a;
  }

  // (2 часть)
  static int calculateNok(int a, int b) {
    double t = a / DelimetersCalculator.calculateNod(a, b) * b;
    return t.toInt();
  }

  // (3 часть)
  static List<int> splitInt(num a) {
    if (a < 1) throw Exception('Расчет возможен только для натуральных чисел');
    var t;
    List<int> result = [];
    for (int i = 2; i != (a + 1);) {
      t = a % i;
      if (t == 0) {
        result.add(i);
        a = a / i;
        i = 2;
      } else {
        i++;
      }
    }
    return result;
  }
}

void main() {
  var a = 10;
  var b = 1000;
  var c = 4;
  var d = 97;
  var f = 40;
  print('Задание 1');

  print('НОД чисел $a и $b = ${DelimetersCalculator.calculateNod(a, b)}');
  print('НОК чисел $c и $d = ${DelimetersCalculator.calculateNok(c, d)}');
  print(
      'Разделение числа $f на простые множители: ${DelimetersCalculator.splitInt(f)}');
}