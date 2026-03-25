import 'dart:io';
import 'task_3_1.dart';
import 'task_3_2.dart';
import 'task_3_3.dart';

void main() {
  while (true) {
  print('Выберите задачу:');
  print('1 - Запись в файл');
  print('2 - Чтение файла');
  print('3 - подсчет строк и слов');

  String choice = stdin.readLineSync()!;

  if (choice == '1') {
    runTask1();
  } else if (choice == '2') {
    runTask2();
  } else if (choice == '3') {
    runTask3();
  } else if (choice == 'q') {
    break;
  } else {
    print('Неверный выбор');
  }

}
}