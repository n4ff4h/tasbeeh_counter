import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:tasbeeh_counter/models/button_row_state.dart';
import 'package:tasbeeh_counter/providers/button_row_provider.dart';
import 'package:tasbeeh_counter/providers/counter_provider.dart';
import 'package:tasbeeh_counter/shared/constants.dart';
import 'package:tasbeeh_counter/widgets/circular_button.dart';
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

    void showSnackBar(BuildContext context) {
      const snackBar = SnackBar(
        content: Text('Alert value reached!'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Stack(
      children: [
        // Tasbeeh Counter outer image
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              assetName,
              color: primaryColor,
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
              color: tasbeehCounterColor,
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
                    CircularButton(
                      size: iconButtonSize,
                      color: secondaryColor,
                      onPressed: isButtonDisabled
                          ? null
                          : () {
                              counterNotifier.decrement();
                              beepAndVibrate(buttonRow);
                            },
                      child: const Icon(
                        Icons.undo_rounded,
                        color: iconColor,
                        size: iconSize,
                      ),
                    ),
                    const SizedBox(width: 105),
                    // Refresh button
                    CircularButton(
                      size: iconButtonSize,
                      color: secondaryColor,
                      onPressed: isButtonDisabled
                          ? null
                          : () {
                              counterNotifier.reset();
                              beepAndVibrate(buttonRow);
                            },
                      child: const Icon(
                        Icons.refresh_rounded,
                        color: iconColor,
                        size: iconSize,
                      ),
                    ),
                  ],
                ),
                // Increment button
                CircularButton(
                  size: counterButtonSize,
                  color: primaryColor,
                  child: null,
                  onPressed: () {
                    counterNotifier.increment();
                    beepAndVibrate(buttonRow);

                    if ((counter + 1) % buttonRow.alertCount == 0) {
                      showSimpleNotification(
                        const Center(
                          child: Text(
                            "Alert value reached!",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        background: const Color(0xFF566B6A),
                        elevation: 2,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void beepAndVibrate(ButtonRowState buttonRow) {
    if (buttonRow.hasToggledVibrate) {
      HapticFeedback.vibrate();
    }
    if (buttonRow.hasToggledSound) {
      AudioPlayer().play(
        AssetSource('audios/click.wav'),
      );
    }
  }
}
