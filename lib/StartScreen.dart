import 'package:flutter/material.dart';
import 'package:xo_game/BoardScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String Player1 = '';

  String Player2 = '';

  final _nameController1 = TextEditingController();

  final _nameController2 = TextEditingController();

  bool press1 = false;

  bool press2 = false;

  bool _isNameEmpty1() {
    return _nameController1.text.isEmpty;
  }

  bool _isNameEmpty2() {
    return _nameController2.text.isEmpty;
  }

  Widget _NameErrorWidget1() {
    if (_isNameEmpty1()) {
      return Text(
        'name can\'t be empty',
        style: TextStyle(color: Colors.red),
      );
    }
    return Text('');
  }

  Widget _NameErrorWidget2() {
    if (_isNameEmpty2()) {
      return Text(
        'name can\'t be empty',
        style: TextStyle(color: Colors.red),
      );
    }
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
            child: Text(
          'XO Game',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      spreadRadius: 4,
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.blue,
                      spreadRadius: -4,
                      blurRadius: 5,
                    )
                  ]),
              child: Text(
                "TIC TAC TOE",
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink,
                          spreadRadius: 4,
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Colors.pink,
                          spreadRadius: -4,
                          blurRadius: 5,
                        )
                      ]),
                  child: TextField(
                    controller: _nameController1,
                    onChanged: (newtext) {
                      Player1 = newtext;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Player1 '\X'"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                press1 ? _NameErrorWidget1() : Container(),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18.0),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink,
                          spreadRadius: 4,
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Colors.pink,
                          spreadRadius: -4,
                          blurRadius: 5,
                        ),
                      ]),
                  child: TextField(
                    controller: _nameController2,
                    onChanged: (newtext) {
                      Player2 = newtext;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Player2 '\O'",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                press2 ? _NameErrorWidget2() : Container(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink,
                      spreadRadius: 4,
                      blurRadius: 10,
                    ),
                    BoxShadow(
                      color: Colors.pink,
                      spreadRadius: -4,
                      blurRadius: 5,
                    )
                  ]),
              child: TextButton(
                onPressed: () {
                  if (Player1.isNotEmpty && Player2.isNotEmpty) {
                    Navigator.of(context).pushNamed(BoardScreen.routeName,
                        arguments: BoardArgs(Player1, Player2));
                  }
                  ;
                  setState(() {
                    _nameController1.clear();
                    _nameController2.clear();
                    press1 = false;
                    press2 = false;

                    if (Player1.isEmpty) {
                      press1 = true;
                    }
                    if (Player2.isEmpty) {
                      press2 = true;
                    }
                    Player1 = '';
                    Player2 = '';
                  });
                },
                child: Text(
                  "Start Game",
                  style: TextStyle(color: Colors.pink),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoardArgs {
  String Player1;
  String PLayer2;
  BoardArgs(this.Player1, this.PLayer2);
}
