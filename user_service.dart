import 'dart:io';
import 'user.dart';


class UserService {


  UserService();

  void userCreateMan (){
    File fileUsers = File('users.txt');
    List<String> oldUsers = [];
    if (fileUsers.existsSync()) {
      oldUsers = fileUsers.readAsLinesSync();
    }
    while (true) {

      print('Введите stop, чтобы завершить добавление пользователей' );

      stdout.write('Введите имя: ');
      String name = stdin.readLineSync()!;

      if (name == 'stop') {
        break;
      }

      String sex = 'male';

      stdout.write('Введите год рождения: ');
      int year = int.parse(stdin.readLineSync()!);

      stdout.write('Введите месяц рождения : ');
      int month = int.parse(stdin.readLineSync()!);

      stdout.write('Введите день рождения: ');
      int day = int.parse(stdin.readLineSync()!);

      int age = 2026 - year;

      int maxId = 0;
      for (int i = 0;i<oldUsers.length;i++){
        List<String> parts = oldUsers[i].split('|');
        int currentId = int.parse(parts[0]);

        if(currentId>maxId){
          maxId = currentId;
        }
      }

      int id = maxId +1;

      stdout.write('Введите количство пивных банок: ');
      int BeerCans = int.parse(stdin.readLineSync()!);

      Man newUser = Man(id, name, age, sex, DateTime(year, month, day),BeerCans);

      oldUsers.add(newUser.toFileString());

      print('Пользователь ${newUser.name} добавлен');
      print('Всего пользователей: ${oldUsers.length}');

      fileUsers.writeAsStringSync(oldUsers.join('\n'));


    }
  }
  void userCreateWoman (){
    File fileUsers = File('users.txt');
    List<String> oldUsers = [];
    if (fileUsers.existsSync()) {
      oldUsers = fileUsers.readAsLinesSync();
    }
    while (true) {

      print('Введите stop, чтобы завершить добавление пользователей' );

      stdout.write('Введите имя: ');
      String name = stdin.readLineSync()!;

      if (name == 'stop') {
        break;
      }

      String sex = 'female';

      stdout.write('Введите год рождения: ');
      int year = int.parse(stdin.readLineSync()!);

      stdout.write('Введите месяц рождения : ');
      int month = int.parse(stdin.readLineSync()!);

      stdout.write('Введите день рождения: ');
      int day = int.parse(stdin.readLineSync()!);

      int age = 2026 - year;

      int maxId = 0;
      for (int i = 0;i<oldUsers.length;i++){
        List<String> parts = oldUsers[i].split('|');
        int currentId = int.parse(parts[0]);

        if(currentId>maxId){
          maxId = currentId;
        }
      }

      int id = maxId +1;

      stdout.write('Введите количство сломанных ногтей: ');
      int nails = int.parse(stdin.readLineSync()!);

      Woman newUser = Woman(id, name, age, sex, DateTime(year, month, day),nails);

      oldUsers.add(newUser.toFileString());

      print('Пользователь ${newUser.name} добавлен');
      print('Всего пользователей: ${oldUsers.length}');

      fileUsers.writeAsStringSync(oldUsers.join('\n'));

    }
  }
  void userDelete () {
    File fileUsers = File('users.txt');
    List<String> oldUsers = [];
    if (fileUsers.existsSync()) {
      oldUsers = fileUsers.readAsLinesSync();
    }
    print('Список пользователей:');
    for (int i = 0; i < oldUsers.length; i++) {
      List<String> parts = oldUsers[i].split('|');
      if (parts[3] == 'male'){
        print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}, Количество пивных банок: ${parts[5]}');
      } else {
        print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}, Количество сломанных ногтей: ${parts[5]}');
      }
    }
    print('Введите id пользователя, которого хотите удалить:');
    int inputID = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < oldUsers.length; i++) {
      List<String> parts = oldUsers[i].split('|');
      int currentID = int.parse(parts[0]);

      if (currentID == inputID) {
        oldUsers.removeAt(i);
        break;
      }
    }
    print('Пользователь $inputID удален');
    print('Сохранить изменения в файл? yes/no');
    String answer = stdin.readLineSync()!;
    if (answer == 'yes' || answer == 'Yes') {
      fileUsers.writeAsStringSync(oldUsers.join('\n'));
      print('Изменения сохранены');
    } else {
      print('Изменения не будут сохранены');
    }
  }
  void userEdit () {
    File fileUsers = File('users.txt');
    List<String> oldUsers = [];
    if (fileUsers.existsSync()) {
      oldUsers = fileUsers.readAsLinesSync();
    }
    print('Список пользователей:');
    for (int i = 0;i<oldUsers.length;i++) {
      List<String> parts = oldUsers[i].split('|');
      if (parts[3] == 'male'){
        print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}, Количество пивных банок: ${parts[5]}');
      } else {
        print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}, Количество сломанных ногтей: ${parts[5]}');
      }
    }

    print('Введите id пользователя, данные которого хотите изменить:');
    int inputID = int.parse(stdin.readLineSync()!);

    print('Введите цифру соответствующую полю, которое хотите изменить:');
    for (int i =0; i < oldUsers.length;i++) {
      List<String> parts = oldUsers[i].split('|');
      int currentID = int.parse(parts[0]);

      if (currentID == inputID) {
        if (parts[3] == 'male') {
          print(
              '1 - Имя\n2 - Возраст\n3 - Пол\n4 - Дата рождения\n5 - Количество пивных банок');
        } else {
          print(
              '1 - Имя\n2 - Возраст\n3 - Пол\n4 - Дата рождения\n5 - Количество сломанных ногтей');
        }
      }
    }
    int inputPart = int.parse(stdin.readLineSync()!);

    print('Введите новое значение');
    String newValue = stdin.readLineSync()!;

    for (int i =0; i < oldUsers.length;i++){
      List<String> parts = oldUsers[i].split('|');
      int currentID = int.parse(parts[0]);

      if (currentID == inputID) {
        parts[inputPart] = newValue;
        oldUsers[i] = parts.join('|');
        break;
      }

    }

    for (int i = 0;i<oldUsers.length;i++){
      List<String> parts = oldUsers[i].split('|');
      if (parts[3] == 'male'){
        print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}, Количество пивных банок: ${parts[5]}');
      } else {
        print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}, Количество сломанных ногтей: ${parts[5]}');
      }
    }
    print('Изменения верны? yes/no');
    String answer = stdin.readLineSync()!;
    if (answer == 'yes' || answer == 'Yes') {
      fileUsers.writeAsStringSync(oldUsers.join('\n'));
      print('Изменения сохранены');
    } else {
      print('Изменения не будут сохранены\nДля повторной попытки редактирования перезапустите программу');
    }

  }
  void userSearch () {
    File fileUsers = File('users.txt');
    List<String> oldUsers = [];
    if (fileUsers.existsSync()) {
      oldUsers = fileUsers.readAsLinesSync();
    }
    print('Введите имя пользователя:');
    String input = stdin.readLineSync()!;
    bool found = false;
    for (int i = 0; i < oldUsers.length; i++) {
      List<String> parts = oldUsers[i].split('|');
      if (parts[1] == input) {
        if (parts[3] == 'male'){
          print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}, Количество пивных банок: ${parts[5]}');
        } else {
          print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}, Количество сломанных ногтей: ${parts[5]}');
        }
        found = true;
      }
    }
    if (found != true) {
      print('Пользователь не найден');
    }
  }
  void userList () {
    File fileUsers = File('users.txt');
    List<String> oldUsers = [];
    if (fileUsers.existsSync()) {
      oldUsers = fileUsers.readAsLinesSync();
    }
    print('Список пользователей:');
    for (int i = 0;i<oldUsers.length;i++){
      List<String> parts = oldUsers[i].split('|');
      if (parts[3] == 'male'){
      print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}, Количество пивных банок: ${parts[5]}');
    } else {
        print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}, Количество сломанных ногтей: ${parts[5]}');
      }
      }
  }
}
