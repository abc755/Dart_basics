//Задание 2
class NumbersConverter {
  // возведение в степень
  static int _pow(int a, int b) {
    if (b == 0) return 1;
    int result = a;
    for (int i = 1; i < b; i++) {
      result *= a;
    }
    return result;
  }

  static int convertTo2(num a) {
    num? t;
    List list = [];
    var result = '';
    if (a < 0) result += '-';
    for (int i = 1; t != 0; i++) {
      list.add(a % 2);
      a = a ~/ 2;
      t = a - a / 2;
    }
    list.reversed.forEach((element) {
      result += element.toString();
    });

    return int.parse(result);
  }

  static int convertTo10(String a) {
    int result = 0;
    var isNegativeNum = false;
    List list = a.split('');

    if (list.first == '-') {
      isNegativeNum = true;
      list.remove('-');
    }
    List listRev = list.reversed.toList();

    for (int i = 0; i < listRev.length; i++) {
      result += int.parse(listRev[i]) * _pow(2, i);
    }
    return isNegativeNum? result*(-1) : result;
  }
}
void main() {
  var a = -375;
  var b = '-101110111';
  print('\nЗадание 2');
  print(
      'Перевод числа $a из десятичной в двоичную: ${NumbersConverter.convertTo2(a)}');
  print(
      'Перевод числа $b из двоичной в десятичную: ${NumbersConverter.convertTo10(b)}');
}