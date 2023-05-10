import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterState {
  int count;

  CounterState(this.count);
}

final counterProvider =
    StateNotifierProvider<CounterNotifier, CounterState>((ref) {
  return CounterNotifier(CounterState(0));
});

class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier(CounterState state) : super(state);

  void increment() {
    state = CounterState(state.count + 1);
  }

  void decrement() {
    state = CounterState(state.count - 1);
  }

  void reset() {
    state = CounterState(0);
  }
}
