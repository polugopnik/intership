import 'dart:io';

class Users {
  String name;
  int age;
  String sex;
  DateTime birthdate;
  int id;
  Users(this.id, this.name, this.age, this.sex, this.birthdate);

  @override
  toString(){
    return 'id: $id Имя: $name, Возраст: $age, Пол: $sex, Дата рождения: ${birthdate.toIso8601String().split('T')[0]}';
  }
  toFileString(){
    return '$id|$name|$age|$sex|${birthdate.toIso8601String().split('T')[0]}';
  }
}
void userCreate (){
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

    stdout.write('Введите пол: ');
    String sex = stdin.readLineSync()!;

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

    Users newUser = Users(id, name, age, sex, DateTime(year, month, day));

    oldUsers.add(newUser.toFileString());

    print('Пользователь ${newUser.name} добавлен');
    print('Всего пользователей: ${oldUsers.length}');

    fileUsers.writeAsStringSync(oldUsers.join('\n'));

  }
}