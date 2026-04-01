import 'dart:io';

class Users {
  final String name;
  final int age;
  final String sex;
  final DateTime birthdate;
  final int id;
  const Users(this.id, this.name, this.age, this.sex, this.birthdate);

  @override
  toString(){
    return 'id: $id Имя: $name, Возраст: $age, Пол: $sex, Дата рождения: ${birthdate.toIso8601String().split('T')[0]}';
  }
  toFileString(){
    return '$id|$name|$age|$sex|${birthdate.toIso8601String().split('T')[0]}';
  }
}

class Woman extends Users {
  int nails;
  Woman(super.id,super.name,super.age,super.sex,super.birthdate,this.nails);

  toFileString(){
    return '$id|$name|$age|$sex|${birthdate.toIso8601String().split('T')[0]}|$nails';
  }
}

class Man extends Users {
  int BeerCans;
  Man(super.id,super.name,super.age,super.sex,super.birthdate,this.BeerCans);

  toFileString(){
    return '$id|$name|$age|$sex|${birthdate.toIso8601String().split('T')[0]}|$BeerCans';
  }
}