import 'dart:io';
void main (){
  File file = File('pokupki.txt');
  String text = file.readAsStringSync();

  print(text);
}