import 'package:flutter/material.dart';
import 'package:xo_game/BoardScreen.dart';
import 'package:xo_game/StartScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO Game',
      home: LoginScreen(),
      routes: {
        BoardScreen.routeName: (_) => BoardScreen(),
        LoginScreen.routeName:(_)=> LoginScreen()
      },
    );
  }
}

