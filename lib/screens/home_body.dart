import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasbeeh_counter/providers/counter_notifier_provider.dart';
import 'package:tasbeeh_counter/shared/constants.dart';
import 'package:tasbeeh_counter/widgets/circular_button.dart';
import 'package:tasbeeh_counter/widgets/counter_display.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(counterNotifierProvider.notifier);

    const String assetName = 'assets/images/tasbeeh_counter_layout.svg';

    return Stack(
      children: [
        // Tasbeeh Counter outer image
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SvgPicture.asset(
              assetName,
              color: primaryColor,
              height: 420,
              width: 420,
            ),
          ),
        ),
        // Tasbeeh Counter inner image
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SvgPicture.asset(
              assetName,
              color: tasbeehCounterColor,
              height: 390,
              width: 390,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
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
                      size: 10,
                      color: secondaryColor,
                      child: const Icon(
                        Icons.undo,
                        color: iconColor,
                        size: 32,
                      ),
                      onPressed: () => notifier.decrement(),
                    ),
                    const SizedBox(width: 105),
                    // Refresh button
                    CircularButton(
                      size: 10,
                      color: secondaryColor,
                      child: const Icon(
                        Icons.refresh,
                        color: iconColor,
                        size: 32,
                      ),
                      onPressed: () => notifier.reset(),
                    ),
                  ],
                ),
                // Increment button
                CircularButton(
                  size: 65,
                  color: primaryColor,
                  child: null,
                  onPressed: () => notifier.increment(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
