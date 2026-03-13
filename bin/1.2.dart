import 'dart:io';

void main() {
  print('Введите первое число:');
  int a = int.parse(stdin.readLineSync()!);

  print('Введите второе число:');
  int b = int.parse(stdin.readLineSync()!);

  print('Сумма: ${a + b}');
  print('Разность: ${a - b}');
  print('Произведение: ${a * b}');
  print('Частное: ${a / b}');
}