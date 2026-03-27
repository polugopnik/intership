import 'dart:io';
import 'userCreate.dart';
import 'UserDelete.dart';
import 'UserEdit.dart';

void main() {
  while (true) {
    print('Выберите задачу:');
    print('1 - Добавить нового пользователя');
    print('2 - Удалить пользователя');
    print('3 - Редактировать пользователя');

    String choice = stdin.readLineSync()!;

    if (choice == '1') {
      userCreate();
    } else if (choice == '2') {
      userDelete();
    } else if (choice == '3') {
      userEdit();
    } else if (choice == 'q') {
      break;
    } else {
      print('Неверный выбор');
    }

  }
}