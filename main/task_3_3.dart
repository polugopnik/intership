import 'dart:io';
void main (){
  File file = File('pokupki.txt');
  String text = file.readAsStringSync();
  for (int i = 0;i<text.length;i++){
    if text.contains('\n')
  }


}