import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp( // Tells dart what should be displayed on the screen
    MaterialApp(
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
          body: GradientContainer(),
        ),
      ),
    ),
  );
}