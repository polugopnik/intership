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
void userDelete () {
  File fileUsers = File('users.txt');
  List<String> oldUsers = [];
  if (fileUsers.existsSync()) {
    oldUsers = fileUsers.readAsLinesSync();
  }
  print('Список пользователей:');
  for (int i = 0; i < oldUsers.length; i++) {
    List<String> parts = oldUsers[i].split('|');
    print(
        'id: ${parts[0]} Имя: ${parts[1]}, Возраст: ${parts[2]}, Пол: ${parts[3]}, Дата рождения: ${parts[4]}');
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