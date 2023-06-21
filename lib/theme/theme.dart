import 'package:flutter/material.dart';

Color primary = Color.fromRGBO(25, 21, 247, 1);

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.grey.shade900,
    visualDensity: VisualDensity(
      horizontal: 4,
      vertical: 2,
    ),
    colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity(
      horizontal: 4,
      vertical: 2,
    ),
    colorScheme: ColorScheme.light(),
  );
}
