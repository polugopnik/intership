import 'dart:io';
void runTask3 (){
  File file = File('pokupki.txt');
  String text = file.readAsStringSync();
  List<String> lines = text.split('\n');
  int lineCount = lines.length;
  int wordCount = text.trim().split(RegExp(r'\s+')).length;
  File count = File('count.txt');
  count.writeAsStringSync('Количество строк:$lineCount\nКоличество слов:$wordCount');
  print(count.readAsStringSync());
  lines.add('Количество строк:$lineCount\nКоличество слов:$wordCount');
  file.writeAsStringSync(lines.join('\n'));
}