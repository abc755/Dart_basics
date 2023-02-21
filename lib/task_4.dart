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

void main() {
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
}