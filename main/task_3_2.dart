import 'dart:io';
void runTask2 (){
  File file = File('pokupki.txt');
  String text = file.readAsStringSync();

  print(text);
}