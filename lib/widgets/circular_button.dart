import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final dynamic child;
  final double size;
  final Color color;
  final VoidCallback onPressed;

  const CircularButton({
    Key? key,
    required this.child,
    required this.size,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(size)),
        backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(0),
      ),
      child: child,
    );
  }
}
