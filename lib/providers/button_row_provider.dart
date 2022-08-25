import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasbeeh_counter/global_providers.dart';
import 'package:tasbeeh_counter/models/button_row_state.dart';

final buttonRowProvider =
    StateNotifierProvider<ButtonRowNotifier, ButtonRowState>((ref) {
  return ButtonRowNotifier(ref.read);
});

class ButtonRowNotifier extends StateNotifier<ButtonRowState> {
  final Reader _read;

  ButtonRowNotifier(this._read)
      : super(
          ButtonRowState(
            hasToggledSound:
                _read(sharedPreferencesProvider).getBool('hasToggledSound') ??
                    false,
            hasToggledVibrate:
                _read(sharedPreferencesProvider).getBool('hasToggledVibrate') ??
                    false,
            alertCount:
                _read(sharedPreferencesProvider).getInt('alertCount') ?? 33,
            isDarkMode:
                _read(sharedPreferencesProvider).getBool('isDarkMode') ?? false,
          ),
        );

  void toggleSound() {
    bool hasToggledSound = !state.hasToggledSound;
    state = state.copyWith(hasToggledSound: hasToggledSound);
    _read(sharedPreferencesProvider)
        .setBool('hasToggledSound', hasToggledSound);
  }

  void toggleVibration() {
    bool hasToggledVibrate = !state.hasToggledVibrate;
    state = state.copyWith(hasToggledVibrate: hasToggledVibrate);
    _read(sharedPreferencesProvider)
        .setBool('hasToggledVibrate', hasToggledVibrate);
  }

  void setAlertCount(int alertCount) {
    state = state.copyWith(alertCount: alertCount);
    _read(sharedPreferencesProvider).setInt('notificationCount', alertCount);
  }

  void setDarkMode() {
    bool isDarkMode = !state.isDarkMode;
    state = state.copyWith(isDarkMode: isDarkMode);
    _read(sharedPreferencesProvider).setBool('isDarkMode', isDarkMode);
  }
}
