import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  final counter = CounterNotifier(number);
  counter.loadState();
  return counter;
});

int number = 0;

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier(state) : super(state);

  void increment() {
    state++;
    saveNumber();
  }

  void decrement() {
    state--;
    saveNumber();
  }

  void reset() {
    state = 0;
    saveNumber();
  }

  void loadState() async {
    final prefs = await SharedPreferences.getInstance();
    number = prefs.getInt('number') ?? 0;
    state = number;
    debugPrint("number loaded *************************: number is $state");
  }

  void saveNumber() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('number', state);
    debugPrint("number saved **************: number is $state");
  }
}
