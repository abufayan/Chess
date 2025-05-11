// ignore_for_file: prefer_const_constructors

import 'package:chess/chess_board.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ChessBoard(),
    );
  }
}

