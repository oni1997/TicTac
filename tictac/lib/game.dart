
import 'package:flutter/material.dart';

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<List<String>> board = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' ']
  ];

  String currentPlayer = 'X';

  void resetGame() {
    setState(() {
      board = [
        [' ', ' ', ' '],
        [' ', ' ', ' '],
        [' ', ' ', ' ']
      ];
      currentPlayer = 'X';
    });
  }

void makeMove(int row, int col) {
  setState(() {
    if (board[row][col] == ' ') {
      board[row][col] = currentPlayer;

      if (checkWin(currentPlayer)) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('$currentPlayer wins!'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetGame();
                  },
                  // child: Text('Play Again'),
                  child: Image.asset("assets/start.png", height: 20, width: 20 ),
                ),
              ],
            );
          },
        );
      } else if (isBoardFull()) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // title: Text("It's a tie!"),
              content: Column(
                children: [
                  Image.asset('assets/tie.gif', height: 300, width: 300),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      resetGame();
                    },
                    // child: Text('Play Again'),
                    child: Image.asset("assets/play.png", height: 20, width: 20 ),
                  ),
                ],
              ),
            );
          },
        );
      } else {
        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
      }
    }
  });
}

  bool checkWin(String player) {
    // Check rows, columns, and diagonals
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == player && board[i][1] == player && board[i][2] == player) {
        return true; // Row win
      }
      if (board[0][i] == player && board[1][i] == player && board[2][i] == player) {
        return true; // Column win
      }
    }
    if (board[0][0] == player && board[1][1] == player && board[2][2] == player) {
      return true; // Diagonal win
    }
    if (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
      return true; // Diagonal win
    }
    return false;
  }

  bool isBoardFull() {
    for (var row in board) {
      if (row.contains(' ')) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Tic-Tac-Toe'),
    ),
    body: ListView( // Wrap the Column with a ListView
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                int row = index ~/ 3;
                int col = index % 3;
                return GestureDetector(
                  onTap: () {
                    makeMove(row, col);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        board[row][col],
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 9,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: resetGame,
              child: Text('Reset Game'),
            ),
          ],
        ),
      ],
    ),
  );
  }

}
