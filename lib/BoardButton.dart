import 'package:flutter/material.dart';

typedef PlayerStateFunc = void Function(int pos);
class BoardButton extends StatefulWidget {
  String text;
  int pos;
  PlayerStateFunc OnPlayerState;

  BoardButton(this.text,this.pos, {required this.OnPlayerState(pos)});

  @override
  State<BoardButton> createState() => _BoardButtonState();
}

class _BoardButtonState extends State<BoardButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: OutlinedButton(

          onPressed: () {
            widget.OnPlayerState(widget.pos);
            setState(() {

            });

          },
          child:ColorText(widget.text),


        ),
      ),
    );
  }
  Widget ColorText(String MyText){
    if (MyText=="X"){
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(18.0),
            ),
            color: Colors.transparent,
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
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 70,
              color: Colors.white),
        ),
      );
    }
    else if (MyText=="O"){
      return Container(
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
              ),

            ]),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 70,
              color: Colors.white),
        ),
      );
    }
    else{
      return Container();
    }
  }
}


