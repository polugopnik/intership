import 'dart:io';

void main() {
  List<List<String>> board = [];

  for (int row = 0; row < 8; row++) {
    List<String> currentRow = [];

    for (int col = 0; col < 8; col++) {
      if ((row + col) % 2 == 0) {
        currentRow.add('□');
      } else {
        currentRow.add('■');
      }
    }

    board.add(currentRow);
  }

  print('Введите координаты:');
  String coord = (stdin.readLineSync() ?? '').toUpperCase();

  int col = coord[0].codeUnitAt(0) - 'A'.codeUnitAt(0);
  int row = int.parse(coord[1]) - 1;

  print('Цвет клетки: ${board[row][col]}');
  for (List<String> currentRow in board){
    for (String cell in currentRow){
      stdout.write('$cell ');
    }
    print('');
  }
}