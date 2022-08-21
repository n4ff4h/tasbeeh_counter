import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'button_row_state.freezed.dart';

@freezed
class ButtonRowState with _$ButtonRowState {
  const factory ButtonRowState({
    required bool hasToggledSound,
    required bool hasToggledVibrate,
    required int notificationCount,
    required bool isDarkMode,
  }) = _ButtonRowState;
}
