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

void main() {
  print('\nЗадание 3');
  print(
      'Поиск чисел в строке \'красный 2 желтый синий 1 5 зеленый 0 белый 0.4\': ${StringConverter.customSplit('красный 2 желтый синий 1 5 зеленый 0 белый 0.4')}');

}