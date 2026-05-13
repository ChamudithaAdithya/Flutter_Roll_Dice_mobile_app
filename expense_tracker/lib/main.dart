import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var KColorSchema = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 102, 255),
);

var DarkColorSchema = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 0, 0),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {});
  runApp(
    MaterialApp(
      darkTheme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: DarkColorSchema,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: DarkColorSchema.onPrimaryContainer,
          foregroundColor: DarkColorSchema.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: DarkColorSchema.secondaryContainer,
          margin: EdgeInsets.all(16),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: KColorSchema,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: KColorSchema.onPrimaryContainer,
          foregroundColor: KColorSchema.primaryContainer,
        ),
        cardTheme: CardThemeData().copyWith(
          color: KColorSchema.secondaryContainer,
          margin: EdgeInsets.all(16),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
