import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasbeeh_counter/providers/button_row_provider.dart';
import 'package:tasbeeh_counter/screens/home_body.dart';
import 'package:tasbeeh_counter/shared/constants.dart';
import 'package:tasbeeh_counter/widgets/counter_alert_dialog.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonRow = ref.watch(buttonRowProvider);
    final buttonRowNotifier = ref.watch(buttonRowProvider.notifier);
    final Size size = MediaQuery.of(context).size;

    ButtonStyle toggleButtonColor(bool state) {
      return ElevatedButton.styleFrom(
        primary: state
            ? (buttonRow.isDarkMode ? darkSecondaryColor : secondaryColor)
            : (buttonRow.isDarkMode
                ? const Color(0xFF222831)
                : primaryLightColor),
      );
    }

    Color toggleButtonIconColor(bool state) {
      return state
          ? (buttonRow.isDarkMode ? const Color(0xFF6c757d) : iconColor)
          : (buttonRow.isDarkMode ? darkIconColor : iconColor);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tasbeeh Counter',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 3),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Alert value: ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFFBCD1D0),
                    ),
                  ),
                  TextSpan(
                    text: buttonRow.alertCount.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: buttonRow.isDarkMode
                          ? const Color(0xFFFF2E63)
                          : secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: const HomeBody(),
      bottomNavigationBar: SizedBox(
        width: size.width,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Sound toggle button
            ElevatedButton(
              style: toggleButtonColor(buttonRow.hasToggledSound),
              onPressed: buttonRowNotifier.toggleSound,
              child: Icon(
                Icons.volume_up_rounded,
                color: toggleButtonIconColor(buttonRow.hasToggledSound),
                size: iconSize,
              ),
            ),
            // Vibration toggle button
            ElevatedButton(
              style: toggleButtonColor(buttonRow.hasToggledVibrate),
              onPressed: buttonRowNotifier.toggleVibration,
              child: Icon(
                Icons.vibration_rounded,
                color: toggleButtonIconColor(buttonRow.hasToggledVibrate),
                size: iconSize,
              ),
            ),
            // Alert count button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: buttonRow.isDarkMode
                      ? const Color(0xFF222831)
                      : primaryLightColor),
              onPressed: () async {
                int? notificationCount = await showCounterAlertDialog(
                  context,
                  buttonRow.alertCount,
                  size,
                );
                buttonRowNotifier
                    .setAlertCount(notificationCount ?? buttonRow.alertCount);
              },
              child: Icon(
                Icons.notification_add_rounded,
                color: buttonRow.isDarkMode ? darkIconColor : iconColor,
                size: iconSize,
              ),
            ),
            // Dark theme toggle button
            ElevatedButton(
              style: toggleButtonColor(buttonRow.isDarkMode),
              onPressed: buttonRowNotifier.setDarkMode,
              child: Icon(
                Icons.dark_mode_rounded,
                color: toggleButtonIconColor(buttonRow.isDarkMode),
                size: iconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
