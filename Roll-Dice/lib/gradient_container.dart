import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

const AlignmentGeometry startAlignment = Alignment.topLeft;
const AlignmentGeometry endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  // Named Perameters , Positional Perameters, Required Perameters
  // Named Perametrs can be optional or required,
  // Positional Perameters are always required
  // Named Perameters are wrapped in curly braces {},
  // Positional Perameters are wrapped in square brackets []

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(child: DiceRoller()),
    );
  }
}
