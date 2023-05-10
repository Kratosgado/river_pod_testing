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
    final number = ref.read(counterProvider.notifier);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                elevation: 10,
                child: Text(
                  '$count',
                  style: const TextStyle(fontSize: 20),
                ),
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    elevation: 10,
                    color: Colors.tealAccent,
                    child: const Text('increase'),
                    onPressed: () {
                      number.increment();
                    },
                  ),
                  MaterialButton(
                    elevation: 30,
                    color: const Color.fromARGB(255, 234, 7, 255),
                    onPressed: () => number.decrement(),
                    child: const Text('decrease'),
                  ),
                  MaterialButton(
                    elevation: 10,
                    color: Colors.amber,
                    onPressed: () => number.reset(),
                    child: const Text('reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
