import 'package:flutter/material.dart';
import 'package:tasbeeh_counter/widgets/digital_font/digital_font.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        child: DigitalNumber(
                          value: 69,
                          height: maxHeight * 0.65,
                          color: Colors.black,
                        ),
                      ),
                      DigitalNumber(
                        value: 888888,
                        height: maxHeight * 0.65,
                        color: Colors.black12,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
