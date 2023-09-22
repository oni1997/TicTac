import 'package:flutter/material.dart';
import 'game.dart'; // Import the TicTacToeGame class from the game.dart file

import 'package:flutter/material.dart';

class StartMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Tic-Tac-Toe'),
    //   ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Place your image at the top center
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/Untitled_design-removebg-preview.png',
                width: 200.0,
                height: 200.0,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TicTacToeGame()),
              );
            },
            child: Text('Start Game'),
          ),
        ],
      ),
    );
  }
}