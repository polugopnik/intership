import 'dart:io';

class Users {
  String name;
  int age;
  String sex;
  DateTime birthdate;
  Users(this.name, this.age, this.sex, this.birthdate);

  @override
  toString(){
    return '$name|$age|$sex|$birthdate';
  }
}
void main (){
  File fileUsers = File('users.txt');
  List<String> oldUsers = [];
  if (fileUsers.existsSync()) {
    oldUsers = fileUsers.readAsLinesSync();
  }
  print(oldUsers);
  while (true) {

    stdout.write('Введите имя: ');
    String name = stdin.readLineSync()!;

    if (name == 'stop') {
      break;
    }

    stdout.write('Введите возраст: ');
    int age = int.parse(stdin.readLineSync()!);

    stdout.write('Введите пол: ');
    String sex = stdin.readLineSync()!;

    stdout.write('Введите год рождения: ');
    int year = int.parse(stdin.readLineSync()!);

    stdout.write('Введите месяц рождения : ');
    int month = int.parse(stdin.readLineSync()!);

    stdout.write('Введите день рождения: ');
    int day = int.parse(stdin.readLineSync()!);

    Users newUser = Users(name, age, sex, DateTime(year, month, day));

    oldUsers.add(newUser.toString());

    print('Пользователь ${newUser.name} добавлен');
    print('Всего пользователей: ${oldUsers.length}');

    fileUsers.writeAsStringSync(oldUsers.join('\n'));

  }
  for (int i = 0;i<oldUsers.length;i++){
    print(oldUsers[i]);
  }

}