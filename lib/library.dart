//  Задание 1

import 'dart:math';

class DelimetersCalculator {
  // (1 часть)
  static int calculateNod(int a, int b) {
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

  static int convertTo10(int a) {
    int result = 0;
    List list = a.toString().split('');
    List listRev = list.reversed.toList();

    for (int i = 0; i < listRev.length; i++) {
      result += int.parse(listRev[i]) * _pow(2, i);
    }
    return result;
  }
}

//Задание 3
class StringConverter {
  static List customSplit(String string) {
    List list = string.split(' ');
    List listResult = [];
    list.forEach((element) {
      if (num.tryParse(element) != null) listResult.add(element);
    });
    return listResult;
  }
}

//Задание 4
class WordConverter {
  static Map<String, int> countWords(List collection) {
    Map<String, int> map = {};
    collection.forEach((element) {
      if (map.containsKey(element)) {
        map.update(element, (value) => value + 1);
      } else {
        map[element] = 1;
      }
    });
    return map;
  }
}

//Задание 5
class CollectionConverter {
  static Set<int> calculate(List<String> list) {
    const library = {
      'zero': 0,
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
      'eight': 8,
      'nine': 9
    };
    final Set<int> newList = {};
    list.forEach((element) {
      if (library.containsKey(element)) {
        newList.add(library[element]!);
      }
    });
    return newList;
  }
}

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

//Задание 8
class User {
  String email;

  User(this.email);
}

class AdminUser extends User with UserProps {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

mixin UserProps on User {
  String getMailSystem() {
    return this.email.split('@').last;
  }
}

class UserManager<T extends User> {
  Set<T> users = {};

  void addUser(T user) {
    users.add(user);
  }

  void deleteUser(T user) {
    users.remove(user);
  }

  void printUsersEmails() {
    List<String> emailList = [];
    users.forEach((element) {
      if (element is AdminUser) {
        emailList.add(element.getMailSystem());
      } else {
        emailList.add(element.email);
      }
    });
    print(emailList);
  }
}

void main() {
  print('2.6 Практическая работа');
  print('Задание 1');

  print('НОД чисел 10 и 1000 = ${DelimetersCalculator.calculateNod(10, 1000)}');
  print('НОК чисел 4 и 97 = ${DelimetersCalculator.calculateNok(4, 97)}');
  print(
      'Разделение числа 40 на простые множители: ${DelimetersCalculator.splitInt(40)}');

  print('\nЗадание 2');
  print(
      'Перевод числа 375 из десятичной в двоичную: ${NumbersConverter.convertTo2(375)}');
  print(
      'Перевод числа 101110111 из двоичной в десятичную: ${NumbersConverter.convertTo10(101110111)}');

  print('\nЗадание 3');
  print(
      'Поиск чисел в строке \'красный 2 желтый синий 1 5 зеленый 0 белый 0.4\': ${StringConverter.customSplit('красный 2 желтый синий 1 5 зеленый 0 белый 0.4')}');

  print('\nЗадание 4');
  List<String> list = [
    'белый',
    'красный',
    'синий',
    'синий',
    'синий',
    'красный'
  ];
  print('Исходный список ${list}');
  print('Подсчет количества вхождений слов в Map: ${WordConverter.countWords(list)}');

  print('\nЗадание 5');
  var listForTask5 = ['one', 'two', 'three', 'cat', 'dog', 'seven', 'one', 'five'];
  print('Исходный список ${listForTask5}');
  print('Перевод в числа: ${CollectionConverter.calculate(listForTask5)}');

  print('\nЗадание 6');
  var firstPoint = Point(5, 10, 15);
  var secondPoint = Point(20, 30, 40);
  var distance = firstPoint.distanceTo(secondPoint);
  print(firstPoint.info());
  print(secondPoint.info());
  print('Дистанция между точками: ${distance}');

  print('\nЗадание 7');
  print('Корень 3 степени из числа 1728 = ${1728.calculateSqrt(3)}');
  // print(500.calculateSqrt(1700)); //выдает Infinity, нужно уточнить почему и что с этим делать

  print('\nЗадание 8');
  var users = UserManager();
  var petya = User('petya@domail.com');
  var kolya = AdminUser('kolya@admin.com');
  var vasya = GeneralUser('vasya@domail.com');
  users.addUser(petya);
  users.addUser(kolya);
  users.addUser(vasya);
  users.deleteUser(vasya);
  print('Список email пользователей после добавления и удаления:');
  users.printUsersEmails();
}