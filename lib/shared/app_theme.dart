import 'package:flutter/material.dart';
import 'package:tasbeeh_counter/shared/constants.dart';

class AppTheme {
  // Private Constructor
  AppTheme._();

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: scaffoldBackgroundColor,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: scaffoldBackgroundColor,
    ),
  );
}
