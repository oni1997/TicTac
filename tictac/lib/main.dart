
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'start_menu.dart';


void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartMenu(),
    );
  }
}