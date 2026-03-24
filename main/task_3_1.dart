import 'dart:io';
void main() {
  List<String> pokupki = [];

  while (true) {
    print('Введите что нужно купить:');
    String input = stdin.readLineSync()!;
    if (input == 'q'){
      break;
    }
    if (input.isNotEmpty){
      pokupki.add(input);
    }
  }
  print(pokupki);
  File file = File('pokupki.txt');
  file.writeAsStringSync(pokupki.join(', '));

  print('Список сохранён в файл pokupki.txt');

}