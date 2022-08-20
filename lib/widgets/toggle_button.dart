import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasbeeh_counter/shared/constants.dart';

class ToggleButton extends ConsumerWidget {
  final IconData icon;

  const ToggleButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all(primaryColor),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 32,
      ),
    );
  }
}
