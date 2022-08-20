import 'package:flutter/material.dart';
import 'package:tasbeeh_counter/shared/constants.dart';

class CircularButton extends StatelessWidget {
  final dynamic widget;
  final double size;
  final Color color;

  const CircularButton({
    Key? key,
    required this.widget,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(size)),
        backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(0),
      ),
      child: widget,
    );
  }
}
