import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterPrvider = Provider<int>(
  (ref) {
    return 0;
  },
);

final counterProvider = Provider<Counter>((ref) {
  return Counter(counter: 0);
});

class Counter {
  int counter;
  Counter({required this.counter});

  void increase() {
    counter++;
  }
}
