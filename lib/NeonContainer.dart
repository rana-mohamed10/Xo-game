import 'package:flutter/material.dart';

Widget MyNeonContainer (String text){

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.yellow,
              spreadRadius: 4,
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.yellow,
              spreadRadius: -4,
              blurRadius: 5,
            )
          ]),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

