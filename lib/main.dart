import 'package:flutter/material.dart';

void main() {
  runApp(const TasbeehCounterApp());
}

class TasbeehCounterApp extends StatelessWidget {
  const TasbeehCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}
