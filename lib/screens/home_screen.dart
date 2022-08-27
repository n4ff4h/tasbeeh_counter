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

    ButtonStyle toggleColor(bool state) {
      return ElevatedButton.styleFrom(
        primary: state ? toggleButtonActiveColor : primaryColor,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
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
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFFFFCB42),
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
              style: toggleColor(buttonRow.hasToggledSound),
              onPressed: buttonRowNotifier.toggleSound,
              child: icon(Icons.volume_up_rounded),
            ),
            // Vibration toggle button
            ElevatedButton(
              style: toggleColor(buttonRow.hasToggledVibrate),
              onPressed: buttonRowNotifier.toggleVibration,
              child: icon(Icons.vibration_rounded),
            ),
            // Alert count button
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: primaryColor),
              onPressed: () async {
                int? notificationCount = await showCounterAlertDialog(
                  context,
                  buttonRow.alertCount,
                  size,
                );
                buttonRowNotifier
                    .setAlertCount(notificationCount ?? buttonRow.alertCount);
              },
              child: icon(Icons.notification_add_rounded),
            ),
            // Dark theme toggle button
            ElevatedButton(
              style: toggleColor(buttonRow.isDarkMode),
              onPressed: buttonRowNotifier.setDarkMode,
              child: icon(Icons.dark_mode_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
