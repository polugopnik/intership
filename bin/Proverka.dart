import 'dart:io';
void main() {
  while (true) {
    print('Введите выражение:');
    String input = stdin.readLineSync()!;
    if (input == 'exit' || input == 'q') {
      break;
    }
    if (!RegExp(r'^[0-9+\-*/\s]+$').hasMatch(input)) {
      print('Некорректный ввод');
      continue;
    }
    List<String> stroki = input.split(' ');
    if (stroki.length != 3) {
      print('Некорректный ввод');
      continue;
    }
    if (int.tryParse(stroki[0]) == null || int.tryParse(stroki[2]) == null) {
      print('Некорректный ввод');
      continue;
    }
    int a = int.parse(stroki[0]);
    String oper = stroki[1];
    int b = int.parse(stroki[2]);
    if (oper == '/' && b == 0) {
      print('На ноль делить нельзя');
      continue;
    }
    if (oper == '+') {
      print(a + b);
    } else if (oper == '-') {
      print(a - b);
    } else if (oper == '*') {
      print(a * b);
    } else if (oper == '/') {
      print(a / b);
    } else {
      print('Некорректный ввод');
    }
  }
}




