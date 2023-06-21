import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );
}
