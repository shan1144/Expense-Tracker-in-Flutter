import 'package:expense_tracker/Screens/Home/home.dart';
import 'package:flutter/material.dart';

var kcolorscheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 237, 148, 80),
);
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kcolorscheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kcolorscheme.primary,
        foregroundColor: kcolorscheme.onPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: kcolorscheme.primaryContainer,
      )),
      cardTheme: const CardTheme().copyWith(
        color: kcolorscheme.primaryContainer,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      // textTheme: const TextTheme().copyWith(
      //     bodyLarge: const TextStyle(
      //   fontSize: 30,
      //   fontWeight: FontWeight.bold,
      // ))
    ),
    debugShowCheckedModeBanner: false,
    home: const Home(),
  ));
}
