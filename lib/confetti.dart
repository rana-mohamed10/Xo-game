import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Confetti extends StatefulWidget{
  @override
  State<Confetti> createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti> {
  final _controller=ConfettiController();

  bool isplay=false;

  @override
  Widget build(BuildContext context) {

     _controller.play();
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ConfettiWidget(
          confettiController: _controller,
          blastDirectionality: BlastDirectionality.explosive, //All Directions
          colors: const [Colors.blue, Colors.pink, Colors.yellow],
          gravity: 0.7,
          emissionFrequency: 0.2,
        ),

      ],
    );;
  }
}