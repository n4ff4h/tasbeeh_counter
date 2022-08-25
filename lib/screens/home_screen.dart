import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasbeeh_counter/providers/button_row_provider.dart';
import 'package:tasbeeh_counter/screens/home_body.dart';
import 'package:tasbeeh_counter/shared/constants.dart';
import 'package:tasbeeh_counter/widgets/circular_button.dart';
import 'package:tasbeeh_counter/widgets/counter_alert_dialog.dart';
import 'package:tasbeeh_counter/widgets/toggle_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonRow = ref.watch(buttonRowProvider);
    final buttonRowNotifier = ref.watch(buttonRowProvider.notifier);

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Tasbeeh Counter',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
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
            ToggleButton(
              icon: Icons.volume_up_rounded,
              onPressed: buttonRowNotifier.toggleSound,
              buttonActiveState: buttonRow.hasToggledSound,
            ),
            // Vibration toggle button
            ToggleButton(
              icon: Icons.vibration_rounded,
              onPressed: buttonRowNotifier.toggleVibration,
              buttonActiveState: buttonRow.hasToggledVibrate,
            ),
            // Alert count button
            CircularButton(
              size: iconButtonSize,
              color: primaryColor,
              child: const Icon(
                Icons.notification_add_rounded,
                color: iconColor,
                size: iconSize,
              ),
              onPressed: () async {
                int? notificationCount = await showCounterAlertDialog(
                  context,
                  buttonRow.alertCount,
                  size,
                );
                buttonRowNotifier.setAlertCount(notificationCount ?? 33);
              },
            ),
            // Dark theme toggle button
            ToggleButton(
              icon: Icons.dark_mode_rounded,
              onPressed: buttonRowNotifier.setDarkMode,
              buttonActiveState: buttonRow.isDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}
