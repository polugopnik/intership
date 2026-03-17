import 'dart:io';

void main() {
  print('Введите текст:');
  String text = stdin.readLineSync() ?? "";
  text = text.toLowerCase();
  text = text.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
  print(text);
  Map<String, int> charCount = {};
  for (int i = 0; i < text.length; i++) {
    String char = text[i];

    if (char == ' ') continue;

    if (charCount.containsKey(char)) {
      charCount[char] = charCount[char]! + 1;
    } else {
      charCount[char] = 1;
    }
  }
  print(charCount);
}