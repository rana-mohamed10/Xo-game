import 'package:flutter/material.dart';
import 'package:xo_game/BoardButton.dart';
import 'package:xo_game/StartScreen.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = "BoardScreen";

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  int player1Score = 0;
  int player2Score = 0;
  List<String> ButtonState = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    BoardArgs args = ModalRoute.of(context)?.settings.arguments as BoardArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.Player1}',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "'\X'",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '$player1Score',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.PLayer2}',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "'\O'",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '$player2Score',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(ButtonState[0], 0,
                    OnPlayerState: (pos) => PlayerState(0)),
                BoardButton(ButtonState[1], 1,
                    OnPlayerState: (pos) => PlayerState(1)),
                BoardButton(ButtonState[2], 2,
                    OnPlayerState: (pos) => PlayerState(2)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(ButtonState[3], 3,
                    OnPlayerState: (pos) => PlayerState(3)),
                BoardButton(ButtonState[4], 4,
                    OnPlayerState: (pos) => PlayerState(4)),
                BoardButton(ButtonState[5], 5,
                    OnPlayerState: (pos) => PlayerState(5)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(ButtonState[6], 6,
                    OnPlayerState: (pos) => PlayerState(6)),
                BoardButton(ButtonState[7], 7,
                    OnPlayerState: (pos) => PlayerState(7)),
                BoardButton(ButtonState[8], 8,
                    OnPlayerState: (pos) => PlayerState(8)),
              ],
            ),
          )
        ],
      ),
    );
  }

  int counter = 0;

  void PlayerState(int index) {
    if (ButtonState[index].isNotEmpty) {
      initBoard();

      return;
    }
    if (counter.isEven) {
      setState(() {
        ButtonState[index] = "X";
      });
    } else {
      setState(() {
        ButtonState[index] = "O";
      });
    }
    counter++;
    if (CheckWinner("X")) {
      player1Score += 5;
      initBoard();
    } else if (CheckWinner("O")) {
      player2Score += 5;
      initBoard();
    } else if (counter > 9) {
      initBoard();
    }

  }

  bool CheckWinner(String text) {
    for (int i = 0; i < 9; i += 3) {
      if (ButtonState[i] == text &&
          ButtonState[i + 1] == text &&
          ButtonState[i + 2] == text) return true;
    }
    for (int i = 0; i < 3; i++) {
      if (ButtonState[i + 3] == text &&
          ButtonState[i + 3] == text &&
          ButtonState[i + 6] == text) return true;
    }
    if (ButtonState[0] == text &&
        ButtonState[4] == text &&
        ButtonState[8] == text) return true;
    if (ButtonState[2] == text &&
        ButtonState[4] == text &&
        ButtonState[6] == text) return true;

    return false;
  }

  void initBoard() {
    ButtonState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
  }

  void ShowDialog(String text) {
    if (CheckWinner(text)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: text == 'X'
                  ? Text("The Winner is 'X'")
                  : Text("The Winner is 'O'"),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
