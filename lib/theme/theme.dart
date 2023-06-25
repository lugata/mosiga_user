import 'package:flutter/material.dart';

Color primary = const Color.fromRGBO(25, 21, 247, 1);
Color bg2 = const Color(0xFF191919);

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.grey.shade900,
    visualDensity: const VisualDensity(
      horizontal: 4,
      vertical: 2,
    ),
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,
    visualDensity: const VisualDensity(
      horizontal: 4,
      vertical: 2,
    ),
    colorScheme: const ColorScheme.light(),
  );
}
