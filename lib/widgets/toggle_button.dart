import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasbeeh_counter/shared/constants.dart';

class ToggleButton extends ConsumerWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool buttonActiveState;

  const ToggleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.buttonActiveState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all(
            buttonActiveState ? const Color(0xFFFFCB42) : primaryColor),
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
