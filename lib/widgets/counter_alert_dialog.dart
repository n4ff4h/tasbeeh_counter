import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasbeeh_counter/providers/button_row_provider.dart';
import 'package:tasbeeh_counter/shared/constants.dart';

Future<int?> showCounterAlertDialog(
  BuildContext context,
  int currentAlertCount,
  Size size,
) {
  final TextEditingController controller =
      TextEditingController(text: currentAlertCount.toString());

  return showGeneralDialog(
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: widget,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 3.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Set alert value:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: controller,
                autofocus: true,
                cursorColor: primaryLightColor,
                textAlign: TextAlign.center,
                decoration: inputDecoration,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              Consumer(builder: (context, ref, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              ref.read(buttonRowProvider).isDarkMode
                                  ? const Color(0xFFFF2E63)
                                  : secondaryColor),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel', style: dialogButtonTextStyle),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              ref.read(buttonRowProvider).isDarkMode
                                  ? const Color(0xFFFF2E63)
                                  : secondaryColor),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          controller.text.isNotEmpty
                              ? int.parse(controller.text)
                              : 33,
                        );
                      },
                      child: const Text('Save', style: dialogButtonTextStyle),
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      );
    },
  );
}
