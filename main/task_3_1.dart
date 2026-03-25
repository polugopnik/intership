import 'dart:io';
void runTask1() {
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
  file.writeAsStringSync(pokupki.join('\n'));

  print('Список сохранён в файл pokupki.txt');

}