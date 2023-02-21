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
void main() {
  print('\nЗадание 5');
  var listForTask5 = ['one', 'two', 'three', 'cat', 'dog', 'seven', 'one', 'five'];
  print('Исходный список ${listForTask5}');
  print('Перевод в числа: ${CollectionConverter.calculate(listForTask5)}');
}