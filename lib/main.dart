import 'package:flutter/material.dart';
import 'package:tasbeeh_counter/screens/home_screen.dart';
import 'package:tasbeeh_counter/theme.dart';

void main() {
  runApp(const TasbeehCounterApp());
}

class TasbeehCounterApp extends StatelessWidget {
  const TasbeehCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomeScreen(),
    );
  }
}
