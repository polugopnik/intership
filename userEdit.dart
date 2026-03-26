import 'dart:io';

class Users {
  String name;
  int age;
  String sex;
  DateTime birthdate;
  Users(this.name, this.age, this.sex, this.birthdate);

  @override
  toString(){
    return 'Имя: $name, Возраст: $age, Пол: $sex, Дата рождения: $birthdate';
  }
}
void main (){
  List<Users> users = [];
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

    users.add(newUser);

    print('Пользователь ${users.last.name} добавлен');
    print('Всего пользователей: ${users.length}');
  }
  for (int i = 0;i<users.length;i++){
    print(users[i].toString());
  }
}