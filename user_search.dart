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
      print(
          'id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}');
      found = true;
    }
  }
  if (found != true) {
    print('Пользователь не найден');
  }
}