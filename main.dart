import 'dart:io';
import 'user.dart';
import 'user_service.dart';
void main() {
  UserService myUserService = UserService();
  while (true) {
    print('Выберите задачу:');
    print('1 - Добавить нового пользователя - мужчина');
    print('2 - Добавить нового пользователя - женщина');
    print('3 - Удалить пользователя');
    print('4 - Редактировать пользователя');
    print('5 - Показать список пользователей');
    print('6 - Поиск пользователя по имени');


    String choice = stdin.readLineSync()!;

    if (choice == '1') {
      myUserService.userCreateMan();
    } else if (choice == '2') {
      myUserService.userCreateWoman();
    } else if (choice == '3') {
      myUserService.userDelete();
    } else if (choice == '4') {
      myUserService.userEdit();
    } else if (choice == '5') {
      myUserService.userList();
    } else if (choice == '6') {
      myUserService.userSearch();
    } else if (choice == 'q') {
      break;
    } else {
      print('Неверный выбор');
    }

  }
}