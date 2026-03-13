import 'dart:io';

void main() {
  print('Введите число:');
  int a = int.parse(stdin.readLineSync()!);
  print(a % 2 == 0);
}