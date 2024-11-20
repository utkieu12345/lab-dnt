import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Center(
            child: Text("Dicee App"),
          ),
          backgroundColor: Colors.red,
        ),
        body: DiceePage()),
  ));
}

class DiceePage extends StatefulWidget {
  @override
  _DiceePageState createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void dicee() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: <Widget>[
        Expanded(
            child: TextButton(
                onPressed: dicee,
                child: Image.asset('images/dice$leftDiceNumber.png'))),
        Expanded(
            child: TextButton(
                onPressed: dicee,
                child: Image.asset('images/dice$rightDiceNumber.png')))
      ],
    ));
  }
}