import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasbeeh_counter/global_providers.dart';

final counterNotifierProvider =
    StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier(ref.read);
});

class CounterNotifier extends StateNotifier<int> {
  final Reader _reader;

  CounterNotifier(this._reader)
      : super(_reader(sharedPreferencesProvider).getInt('counter') ?? 0);

  void increment() {
    state += 1;
    _reader(sharedPreferencesProvider).setInt('counter', state);
  }

  void decrement() {
    if (state != 0) {
      state -= 1;
      _reader(sharedPreferencesProvider).setInt('counter', state);
    }
  }

  void reset() {
    state = 0;
    _reader(sharedPreferencesProvider).setInt('counter', state);
  }
}
