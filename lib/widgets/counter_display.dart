import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasbeeh_counter/providers/counter_provider.dart';
import 'package:tasbeeh_counter/widgets/digital_font/digital_font.dart';

class CounterDisplay extends ConsumerWidget {
  const CounterDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(counterProvider);

    return Center(
      child: Container(
        height: 70,
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xFFB1D7B4),
        ),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final maxHeight = constraints.maxHeight;
              final maxWidth = constraints.maxWidth;

              return SizedBox(
                height: maxHeight * 0.95,
                width: maxWidth * 0.845,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: DigitalNumber(
                        value: notifier,
                        height: maxHeight * 0.65,
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: DigitalNumber(
                        value: 888888,
                        height: maxHeight * 0.65,
                        color: Colors.black12,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
