import 'package:flutter/material.dart';

const marvelRed = Color(0xFFed1d24);

final comicTheme = ThemeData(
  textTheme: const TextTheme().merge(
    const TextTheme(
      headline5: TextStyle(
        color: marvelRed,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: marvelRed,
    onPrimary: Colors.white,
    secondary: Color(0xFFfdf300),
    onSecondary: Colors.black,
    error: Color.fromARGB(255, 233, 122, 114),
    onError: Colors.black,
    background: Colors.black,
    onBackground: Colors.white,
    surface: Color.fromARGB(198, 0, 0, 0),
    onSurface: Colors.white70,
  ),
  primarySwatch: Colors.blue,
);
