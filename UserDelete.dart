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
  print(fileUsers.readAsStringSync());
  print('Введите id пользователя, которого хотите удалить:');
  int inputID = int.parse(stdin.readLineSync()!);
  String choice = stdin.readLineSync()!;
  if (choice == 'q'){
    break;
  }


  for (int i =0; i < oldUsers.length;i++){
    List<String> parts = oldUsers[i].split('|');
    int currentID = int.parse(parts[0]);

    if (currentID == inputID) {
      oldUsers.removeAt(i);
      break;

  }
  }
  fileUsers.writeAsStringSync(oldUsers.join('\n'));

  print(fileUsers.readAsLinesSync());

}