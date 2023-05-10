import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:river_pod_testing/riverpodstate.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$count',
              ),
              MaterialButton(
                  elevation: 10,
                  color: Colors.tealAccent,
                  child: const Text('increase'),
                  onPressed: () {
                    ref.read(counterProvider.notifier).increment();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
