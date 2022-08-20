import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasbeeh_counter/shared/constants.dart';
import 'package:tasbeeh_counter/widgets/circular_button.dart';
import 'package:tasbeeh_counter/widgets/counter_display.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String assetName = 'assets/tasbeeh_counter_layout.svg';

    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SvgPicture.asset(
              assetName,
              color: primaryColor,
              height: 400,
              width: 400,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SvgPicture.asset(
              assetName,
              color: tasbeehCounterColor,
              height: 375,
              width: 375,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CounterDisplay(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularButton(
                      size: 10,
                      color: secondaryColor,
                      widget: Icon(
                        Icons.undo,
                        color: iconColor,
                        size: 32,
                      ),
                    ),
                    SizedBox(width: 100),
                    CircularButton(
                      size: 10,
                      color: secondaryColor,
                      widget: Icon(
                        Icons.sync,
                        color: iconColor,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                const CircularButton(
                  size: 60,
                  color: primaryColor,
                  widget: null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
