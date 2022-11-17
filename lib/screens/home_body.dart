import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:tasbeeh_counter/providers/button_row_provider.dart';
import 'package:tasbeeh_counter/providers/counter_provider.dart';
import 'package:tasbeeh_counter/shared/constants.dart';
import 'package:tasbeeh_counter/widgets/counter_display.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final counterNotifier = ref.watch(counterProvider.notifier);
    final buttonRow = ref.watch(buttonRowProvider);

    final bool isButtonDisabled = (counter == 0) ? true : false;
    const String assetName = 'assets/images/tasbeeh_counter_layout.svg';

    ButtonStyle undoAndResetButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.disabled)) {
          return buttonRow.isDarkMode
              ? darkPrimaryLightColor
              : primaryColor; // Disabled color
        }
        return buttonRow.isDarkMode
            ? darkPrimaryLightColor
            : primaryColor; // Regular color
      }),
    );

    void beepAndVibrate() {
      if (buttonRow.hasToggledVibrate) {
        HapticFeedback.vibrate();
      }
      if (buttonRow.hasToggledSound) {
        AudioPlayer().play(
          AssetSource('audios/click.wav'),
        );
      }
    }

    return Stack(
      children: [
        // Tasbeeh Counter outer image
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              assetName,
              color:
                  buttonRow.isDarkMode ? darkPrimaryColor : primaryLightColor,
              height: outerTasbeehCounterSvgSize,
              width: outerTasbeehCounterSvgSize,
            ),
          ),
        ),
        // Tasbeeh Counter inner image
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              assetName,
              color: buttonRow.isDarkMode
                  ? darkPrimaryDarker
                  : tasbeehCounterColor,
              height: innerTasbeehCounterSvgSize,
              width: innerTasbeehCounterSvgSize,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CounterDisplay(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Undo button
                    ElevatedButton(
                      style: undoAndResetButtonStyle,
                      onPressed: isButtonDisabled
                          ? null
                          : () {
                              counterNotifier.decrement();
                              beepAndVibrate();
                            },
                      child: Icon(
                        Icons.undo_rounded,
                        color: buttonRow.isDarkMode
                            ? const Color(0xFF343a40)
                            : iconColor,
                        size: iconSize,
                      ),
                    ),
                    const SizedBox(width: 105),
                    // Refresh button
                    ElevatedButton(
                      style: undoAndResetButtonStyle,
                      onPressed: isButtonDisabled
                          ? null
                          : () {
                              counterNotifier.reset();
                              beepAndVibrate();
                            },
                      child: Icon(
                        Icons.refresh_rounded,
                        color: buttonRow.isDarkMode
                            ? const Color(0xFF343a40)
                            : iconColor,
                        size: iconSize,
                      ),
                    ),
                  ],
                ),
                // Increment button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(counterButtonSize),
                    primary: buttonRow.isDarkMode
                        ? const Color(0xFFadb5bd)
                        : primaryLightColor,
                  ),
                  onPressed: () {
                    counterNotifier.increment();
                    beepAndVibrate();

                    if ((counter + 1) % buttonRow.alertCount == 0) {
                      showSimpleNotification(
                        const Center(
                          child: Text(
                            "Alert value reached!",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        background: buttonRow.isDarkMode
                            ? const Color(0xFF6c757d)
                            : primaryDarker,
                        elevation: 2,
                      );
                    }
                  },
                  child: null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
