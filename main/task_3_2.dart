import 'dart:io';
void runTask2 (){
  File file = File('pokupki.txt');
  List<String> text = file.readAsLinesSync();
  int b = text.length;
  print('В списке $b строк(и), введите номер нужной строки');
  String input = stdin.readLineSync()!;
  int i = int.parse(input);
  print(text[i-1]);

  print(text);
}