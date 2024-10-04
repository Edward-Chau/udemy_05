import 'package:flutter/material.dart';
import 'package:udemy05_expense_tracke_app/model/ETAcolors.dart';
import 'package:udemy05_expense_tracke_app/widgets/expensens.dart';

var kColorSchem = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: kColorSchem,
        appBarTheme: AppBarTheme(
          foregroundColor: kColorSchem.primaryContainer,
          backgroundColor: kColorSchem.onPrimaryContainer,
        ),
        scaffoldBackgroundColor: Etacolors.themeColorPurple,
        cardTheme: const CardTheme().copyWith(
          color: Colors.pink[50],
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchem.primaryContainer,
            foregroundColor: kColorSchem.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            displayMedium: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,fontSize: 18
            ),),
      ),
      home: const Expensens(),
    ),
  );
}
