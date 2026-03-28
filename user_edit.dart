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
void userEdit () {
  File fileUsers = File('users.txt');
  List<String> oldUsers = [];
  if (fileUsers.existsSync()) {
    oldUsers = fileUsers.readAsLinesSync();
  }
  print('Список пользователей:');
  for (int i = 0;i<oldUsers.length;i++) {
    List<String> parts = oldUsers[i].split('|');
    print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}');
  }

  print('Введите id пользователя, данные которого хотите изменить:');
  int inputID = int.parse(stdin.readLineSync()!);

  print('Введите цифру соответствующую полю, которое хотите изменить:');
  print('1 - Имя\n2 - Возраст\n3 - Пол\n4 - Дата рождения');
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
    print('id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}');
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