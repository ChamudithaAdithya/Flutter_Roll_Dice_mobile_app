import 'package:first_app/styled_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';

final randomnizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoled = 1;

  int getRandomDice() {
    return randomnizer.nextInt(6) + 1;
  }

  void rollDice() {
    setState(() {
      currentDiceRoled = getRandomDice();
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/dice-$currentDiceRoled.png",
          width: 100,
          height: 100,
        ),
        SizedBox(height: 20),
        StyledText(),
        SizedBox(height: 10),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white54,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            backgroundColor: Colors.white10,
          ),
          child: Text(
            "Roll the dice",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white54,
              letterSpacing: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
