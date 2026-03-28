import 'dart:io';
import 'user_create.dart';
import 'user_delete.dart';
import 'user_edit.dart';
import 'user_list.dart';
import 'user_search.dart';

void main() {
  while (true) {
    print('Выберите задачу:');
    print('1 - Добавить нового пользователя');
    print('2 - Удалить пользователя');
    print('3 - Редактировать пользователя');
    print('4 - Показать список пользователей');
    print('5 - Поиск пользователя по имени');


    String choice = stdin.readLineSync()!;

    if (choice == '1') {
      userCreate();
    } else if (choice == '2') {
      userDelete();
    } else if (choice == '3') {
      userEdit();
    } else if (choice == '4') {
      userList();
    } else if (choice == '5') {
      userSearch();
    } else if (choice == 'q') {
      break;
    } else {
      print('Неверный выбор');
    }

  }
}